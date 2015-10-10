package com.example.classtable;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class Modify extends Activity {
	
	private Spinner daySpinner;
	private Spinner orderSpinner;
	private TextView classnameInfo;
	private TextView classroomInfo;
	private TextView teacherInfo;
	private Button changeClassname;
	private Button changeClassroom;
	private Button changeTeacher;
	private Button back;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.modify);
		
		daySpinner = (Spinner) findViewById(R.id.weekday);
		orderSpinner = (Spinner) findViewById(R.id.order);
		classnameInfo = (TextView) findViewById(R.id.classnameInfo);
		classroomInfo = (TextView) findViewById(R.id.classroomInfo);
		teacherInfo = (TextView) findViewById(R.id.teacherInfo);
		changeClassname = (Button) findViewById(R.id.changeClassname);
		changeClassroom = (Button) findViewById(R.id.changeClassroom);
		changeTeacher = (Button) findViewById(R.id.changeTeacher);
		back = (Button) findViewById(R.id.back);
		
		changeClassname.setOnClickListener(new ClickListener());
		changeClassroom.setOnClickListener(new ClickListener());
		changeTeacher.setOnClickListener(new ClickListener());
		back.setOnClickListener(new ClickListener());
		
		daySpinner.setAdapter(new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item
				,new String[]{"星期一","星期二","星期三","星期四","星期五"}));
		orderSpinner.setAdapter(new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item
				,new String[]{"第1，2节","第3，4节","第5，6节","第7，8节","第9，10节"}));
		showInfo(1,1);
		
		daySpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
			@Override
			public void onItemSelected(AdapterView<?> arg0,View arg1,int arg2,long arg3) {
				showInfo(arg2+1, orderSpinner.getSelectedItemPosition()+1);
			}
			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
			
			}
		});
		
		orderSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
			@Override
			public void onItemSelected(AdapterView<?> arg0,View arg1,int arg2,long arg3) {
				showInfo(daySpinner.getSelectedItemPosition()+1, arg2+1);
			}
			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				
			}
		});
	}
	
	private void showInfo(int weekday,int order) {
		final int day_order = weekday*10+order;
		SQLiteDatabase db = new DBHelper(this).getReadableDatabase();
		Cursor cursor = db.query("TABLE_MAIN"
				, new String[]{"DAY_ORDER","CLASSNAME","CLASSROOM","TEACHER"}
				,null,null,null,null,null);
		try {
			if (cursor.moveToFirst()) {
				do {
					if (cursor.getInt(0)==day_order) {
						classnameInfo.setText("课程："+"\n\t"+cursor.getString(1));
						classroomInfo.setText("教室："+"\n\t"+cursor.getString(2));
						teacherInfo.setText("教师："+"\n\t"+cursor.getString(3));
						break;
					}
				} while (cursor.moveToNext());
			}
		} finally {
			cursor.close();
		}
		db.close();
	}
	
	private class ClickListener implements View.OnClickListener {
		@Override
		public void onClick(View v) {
			if (v == changeClassname) {
				final EditText editText = new EditText(Modify.this);
				new AlertDialog.Builder(Modify.this)
					.setTitle("请输入课程名称")
					.setView(editText)
					.setPositiveButton("确认",new DialogInterface.OnClickListener() {
						@Override
						public void onClick(DialogInterface dialog, int which) {
							SQLiteDatabase db = new DBHelper(Modify.this).getWritableDatabase();
							ContentValues args = new ContentValues();
							args.put("CLASSNAME", editText.getText().toString());
							String whereClause = String.format("DAY_ORDER=%1$d"
				,(daySpinner.getSelectedItemPosition()+1)*10+orderSpinner.getSelectedItemPosition()+1);
							db.update("TABLE_MAIN",args,whereClause,null);
							db.close();
							classnameInfo.setText("课程："+"\n\t"+editText.getText().toString());
							if (getSharedPreferences("auto_alarm",0).getBoolean("auto_alarm", false)==true) {
								sendBroadcast(new Intent("newset"));
								Toast.makeText(Modify.this, "自动静音重置", Toast.LENGTH_SHORT).show();
							}
						}
					})
					.setNegativeButton("取消", null)
					.create()
					.show();
			}
			else if (v == changeClassroom) {
				final EditText editText = new EditText(Modify.this);
				new AlertDialog.Builder(Modify.this)
					.setTitle("请输入教室位置")
					.setView(editText)
					.setPositiveButton("确认",new DialogInterface.OnClickListener() {
						@Override
						public void onClick(DialogInterface dialog, int which) {
							SQLiteDatabase db = new DBHelper(Modify.this).getWritableDatabase();
							ContentValues args = new ContentValues();
							args.put("CLASSROOM", editText.getText().toString());
							String whereClause = String.format("DAY_ORDER=%1$d"
				,(daySpinner.getSelectedItemPosition()+1)*10+orderSpinner.getSelectedItemPosition()+1);
							db.update("TABLE_MAIN",args,whereClause,null);
							db.close();
							classroomInfo.setText("教室："+"\n\t"+editText.getText().toString());
				//			sendBroadcast(new Intent("newset"));
						}
					})
					.setNegativeButton("取消", null)
					.create()
					.show();
			}
			else if (v == changeTeacher) {
				final EditText editText = new EditText(Modify.this);
				new AlertDialog.Builder(Modify.this)
					.setTitle("请输入教师姓名")
					.setView(editText)
					.setPositiveButton("确认",new DialogInterface.OnClickListener() {
						@Override
						public void onClick(DialogInterface dialog, int which) {
							SQLiteDatabase db = new DBHelper(Modify.this).getWritableDatabase();
							ContentValues args = new ContentValues();
							args.put("TEACHER", editText.getText().toString());
							String whereClause = String.format("DAY_ORDER=%1$d"
				,(daySpinner.getSelectedItemPosition()+1)*10+orderSpinner.getSelectedItemPosition()+1);
							db.update("TABLE_MAIN",args,whereClause,null);
							db.close();
							teacherInfo.setText("教师："+"\n\t"+editText.getText().toString());
				//			sendBroadcast(new Intent("newset"));
						}
					})
					.setNegativeButton("取消", null)
					.create()
					.show();
			}
			else if (v == back) {
				finish();
			}
		}
		
	}
}
