package com.example.classtable;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends Activity {
	private TextView showText;
	private Button queryBtn;
	private TimechangeReceiver receiver;
	private List<Integer> timeList;
	private ToggleButton toggleButton;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		if (databaseEmpty())
			Toast.makeText(this, "请先设置课程表", Toast.LENGTH_SHORT).show();

		showText = (TextView) findViewById(R.id.show_text);
		queryBtn = (Button) findViewById(R.id.query);
		toggleButton = (ToggleButton) findViewById(R.id.toggle);
		
		timeList = new ArrayList<Integer>();
		receiver = new TimechangeReceiver();
		registerReceiver(receiver, new IntentFilter(Intent.ACTION_TIME_TICK));

		queryBtn.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				startActivity(new Intent(MainActivity.this, Query.class));
			}
		});
		
		toggleButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				SharedPreferences.Editor editor = getSharedPreferences("auto_alarm",0).edit();
				editor.putBoolean("auto_alarm", toggleButton.isChecked());
				editor.commit();
				Toast.makeText(MainActivity.this, "自动静音设置已被修改", Toast.LENGTH_SHORT).show();
				sendBroadcast(new Intent("newset"));
			}
		});
	}

	@Override
	protected void onStart() {
		super.onStart();
		if (getStandardTime())
			updateText();
		toggleButton.setChecked(getSharedPreferences("auto_alarm",0).getBoolean("auto_alarm", false));
		if (timeList.isEmpty()) 
			toggleButton.setClickable(false);
	}
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
		unregisterReceiver(receiver);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.update_table:
			startActivity(new Intent(this, Modify.class));
			return true;
		case R.id.update_time:
			startActivity(new Intent(this, SetTime.class));
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	private boolean getStandardTime() {
		boolean result;
		SQLiteDatabase db = new DBHelper(this).getReadableDatabase();
		Cursor cursor = db
				.query("TIME_TABLE", new String[] { "HOUR", "MINUTE" }, null,
						null, null, null, null);
		try {
			if (cursor.moveToPosition(1)) {
				if (cursor.getInt(0)==0 && cursor.getInt(1)==0) {
					Toast.makeText(this, "请先设置上课时间", Toast.LENGTH_SHORT).show();
					result = false;
				}
				else {
					cursor.moveToFirst();
					timeList.clear();
					do {
						timeList.add(cursor.getInt(0) * 60 + cursor.getInt(1));
					} while (cursor.moveToNext());
					result = true;
				}
			} else {
				Toast.makeText(this, "请先设置上课时间", Toast.LENGTH_SHORT).show();
				result = false;
			}
		} finally {
			cursor.close();
		}
		db.close();
		return result;
	}

	private void updateText() {
		Calendar calendar = Calendar.getInstance();
		int weekday = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int totalMinute = hour * 60 + minute;

		if (weekday == Calendar.SATURDAY - 1 || weekday == Calendar.SUNDAY - 1)
			showText.setText("今天是周末，没课");
		else if (totalMinute < timeList.get(0)) {
			if (showInfo(weekday, 1))
				showText.append("\n\n距离上课时间还有：\n       "
						+ changeToText(timeList.get(0) - totalMinute));
		} else if (totalMinute > timeList.get(9)) {
			showText.setText("接下去没课了\n一天的课已经结束");
		} else {
			for (int i = 1; i < 10; i++) {
				if (totalMinute >= timeList.get(i - 1)
						&& totalMinute <= timeList.get(i)) {
					if (i % 2 == 1) {
						if (showInfo(weekday, i / 2 + 1))
							showText.append("\n\n目前正在上课中\n\n距离下课还有：\n      "
									+ changeToText(timeList.get(i)
											- totalMinute));

						break;
					} else {
						if (showInfo(weekday, i / 2 + 1)) {
							showText.append("\n\n距离上课时间还有：\n       "
									+ changeToText(timeList.get(i)
											- totalMinute));
						}
						break;
					}
				}
			}
		}

	}

	private boolean showInfo(int weekday, int order) {
		SQLiteDatabase db = new DBHelper(this).getReadableDatabase();
		Cursor cursor = db.query("TABLE_MAIN", new String[] { "DAY_ORDER",
				"CLASSNAME", "CLASSROOM", "TEACHER" }, null, null, null, null,
				null);
		try {
			if (cursor.moveToFirst()) {
				do {
					if (cursor.getInt(0) == weekday * 10 + order) {
						if (cursor.getString(1).equals("")) {
							showText.setText("下面没课");
							return false;
						} else {
							showText.setText("课程：\n\t" + cursor.getString(1)
									+ "\n\n教室：\n\t" + cursor.getString(2)
									+ "\n\n教师：\n\t" + cursor.getString(3));
							return true;
						}
					}
				} while (cursor.moveToNext());
			}
		} finally {
			cursor.close();
		}
		db.close();
		return false;
	}

	private String changeToText(int minute) {
		if (minute < 60)
			return minute + "分钟";
		else {
			int hour = minute / 60;
			int min = minute % 60;
			return hour + "小时" + min + "分钟";
		}
	}

	private boolean databaseEmpty() {
		boolean result = true;
		SQLiteDatabase db = new DBHelper(this).getWritableDatabase();
		Cursor cursor = db.query("TABLE_MAIN", new String[] { "CLASSNAME" },
				null, null, null, null, null);
		try {
			if (cursor.moveToFirst()) {
				do {
					if (!cursor.getString(0).equals("")) {
						result = false;
						break;
					}
				} while (cursor.moveToNext());
			} else {
				for (int i = 1; i <= 5; i++) {
					for (int j = 1; j <= 5; j++) {
						ContentValues args = new ContentValues();
						args.put("DAY_ORDER", i * 10 + j);
						args.put("CLASSNAME", "");
						args.put("CLASSROOM", "");
						args.put("TEACHER", "");
						db.insert("TABLE_MAIN", null, args);
					}
				}
			}
		} finally {
			cursor.close();
		}
		db.close();
		return result;
	}

	private class TimechangeReceiver extends BroadcastReceiver {
		@Override
		public void onReceive(Context context, Intent intent) {
			if (timeList.size() == 0) {
				if (getStandardTime())
					updateText();
			} else
				updateText();
		}
	}
}
