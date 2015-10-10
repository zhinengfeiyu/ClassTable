package com.example.classtable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import android.app.Activity;
import android.app.TimePickerDialog;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TimePicker;
import android.widget.Toast;

public class SetTime extends Activity {
	
	private final List<Integer> idList = Arrays.asList(R.id.b11,R.id.b12,R.id.b21,R.id.b22,R.id.b31,
													   R.id.b32,R.id.b41,R.id.b42,R.id.b51,R.id.b52);
	private List<Integer> hourList;
	private List<Integer> minuteList;
	private Button submit;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.set_time);
		
		hourList = new ArrayList<Integer>();
		minuteList = new ArrayList<Integer>();
		submit = (Button) findViewById(R.id.submit);
		
		submit.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				for (int i=1;i<10;i++) {
					if (hourList.get(i-1)*60+minuteList.get(i-1)>=hourList.get(i)*60+minuteList.get(i)) { 
						Toast.makeText(SetTime.this, "时间设置有误", Toast.LENGTH_SHORT).show();
						return;
					}		
				}
				SQLiteDatabase db = new DBHelper(SetTime.this).getWritableDatabase();
				for (int i=0;i<10;i++) {
					ContentValues args = new ContentValues();
					args.put("HOUR", hourList.get(i));
					args.put("MINUTE", minuteList.get(i));
					db.update("TIME_TABLE", args, "ID="+(i+1), null);
				}
				db.close();
				Toast.makeText(SetTime.this, "时间设置成功！", Toast.LENGTH_SHORT).show();
				sendBroadcast(new Intent("newset"));
			}
		});
	}
	
	@Override
	protected void onStart() {
		super.onStart();
		SQLiteDatabase db = new DBHelper(this).getWritableDatabase();
		Cursor cursor = db.query("TIME_TABLE", new String[]{"HOUR","MINUTE"}
												,null , null, null, null, null);
		try {
			if (cursor.moveToFirst()) {
				do {
					hourList.add(cursor.getInt(0));
					minuteList.add(cursor.getInt(1));
					String btnText = formatNum(cursor.getInt(0))+":"+formatNum(cursor.getInt(1));
					((Button) findViewById(idList.get(hourList.size()-1))).setText(btnText);
				} while (cursor.moveToNext());
			}
			else {
				for (int i=0;i<10;i++) {
					ContentValues args = new ContentValues();
					args.put("HOUR", 0);
					args.put("MINUTE", 0);
					db.insert("TIME_TABLE", null, args);
					hourList.add(0);
					minuteList.add(0);
					((Button) findViewById(idList.get(hourList.size()-1))).setText("00:00");
				}
			}
				
		} finally {
			cursor.close();
		}
		db.close();
		for (int i=0;i<10;i++) {
			((Button) findViewById(idList.get(i))).setOnClickListener(new View.OnClickListener() {
				
				@Override
				public void onClick(View v) {
					final View currentBtn = v;
					TimePickerDialog dialog = new TimePickerDialog(SetTime.this
							,new TimePickerDialog.OnTimeSetListener() {
						
						@Override
						public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
							int index = idList.indexOf(currentBtn.getId());
							hourList.set(index, hourOfDay);
							minuteList.set(index, minute);
							((Button) currentBtn).setText(formatNum(hourOfDay)+":"+formatNum(minute));
						}
					},hourList.get(idList.indexOf(v.getId())),minuteList.get(idList.indexOf(v.getId()))
					,true);
					dialog.show();
				}
			});
		}
	}
	
	private String formatNum(int num) {
		if (num<10) return "0"+num;
		else return ""+num;
	}
}
