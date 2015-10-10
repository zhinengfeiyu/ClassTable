package com.example.classtable;

import java.util.Calendar;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.media.AudioManager;
import android.widget.Toast;

public class AlarmReceiver extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {
		
		if (intent.getAction()==null) {
			changeMode(context,intent);
		//	Toast.makeText(context, "接收到广播：null", Toast.LENGTH_LONG).show();
		}
		
		else if (intent.getAction().equals(Intent.ACTION_BOOT_COMPLETED)) {
			if (context.getSharedPreferences("auto_alarm",0).getBoolean("auto_alarm", false)==true) {
				changeMode(context,intent);
				Toast.makeText(context, "开机启动自动静音", Toast.LENGTH_LONG).show();
			}
		}
		
		else if (intent.getAction().equals("newset")) {
			if (context.getSharedPreferences("auto_alarm", 0).getBoolean("auto_alarm", false)==false) {
				PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0
						, new Intent(context,AlarmReceiver.class), 0);
				AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
				alarmManager.cancel(pendingIntent);
		//		Toast.makeText(context, "自动静音取消", Toast.LENGTH_LONG).show();
			}
			else {
				PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0
						, new Intent(context,AlarmReceiver.class), 0);
				AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
				alarmManager.cancel(pendingIntent);
				changeMode(context,intent);
		//		Toast.makeText(context, "自动静音重置", Toast.LENGTH_LONG).show();
			}
		}
		
	}
	
	private void changeMode(Context context,Intent intent) {
		Calendar calendar = Calendar.getInstance();
		int weekday = calendar.get(Calendar.DAY_OF_WEEK)-1;//1
		int hour = calendar.get(Calendar.HOUR_OF_DAY);//14
		int minute = calendar.get(Calendar.MINUTE);//0
		SQLiteDatabase db = new DBHelper(context).getReadableDatabase();
		int order = -1;
		int react = -1;
		Cursor cursor = db.query("TIME_TABLE", null, "HOUR*60+MINUTE>"+(hour*60+minute)
									, null, null, null, "ID");
		if (cursor.moveToFirst()) {
			order = (cursor.getInt(cursor.getColumnIndex("ID"))+1)/2;//以12345为序//4
			react = cursor.getInt(cursor.getColumnIndex("ID"))%2;//1上课 0下课//0
		}
		
		if (react==1 || react==-1) {
			switchToNoisyMode(context);
		}
		else {	
			Cursor cursor2 = db.query("TABLE_MAIN", new String[]{"DAY_ORDER","CLASSNAME"}
									, "DAY_ORDER="+(weekday*10+order), null, null, null, null);
			if (cursor2.moveToFirst()) {//处于周一到周五
				if (cursor2.getString(1).equals("")) 
					switchToNoisyMode(context);
				else 
					switchToSilentMode(context);
			}
			else {//处于周六或周日
				switchToNoisyMode(context);
			}
			cursor2.close();
		}
		
		long passedMilliseconds;
		if (order!=-1) {
			int nextHour = cursor.getInt(cursor.getColumnIndex("HOUR"));
			int nextMinute = cursor.getInt(cursor.getColumnIndex("MINUTE"));
		    passedMilliseconds = System.currentTimeMillis()
						+(nextHour*3600+nextMinute*60-hour*3600-minute*60)*1000;
		}	
		else {
			Cursor cursor3 = db.query("TIME_TABLE", new String[]{"HOUR","MINUTE"}
											, null, null, null, null, null);
			cursor3.moveToFirst();
			int nextHour = cursor3.getInt(0);
			int nextMinute = cursor3.getInt(1);
			passedMilliseconds = System.currentTimeMillis()
						+(24*3600-hour*3600-minute*60+nextHour*3600+nextMinute*60)*1000;
			cursor3.close();
		}
		PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0
				, new Intent(context,AlarmReceiver.class), 0);
		AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
		alarmManager.set(AlarmManager.RTC_WAKEUP, passedMilliseconds, pendingIntent);
		cursor.close();
		
		db.close();
	}
	
	private void switchToNoisyMode(Context context) {
		AudioManager audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
		if (audioManager.getRingerMode()!=AudioManager.RINGER_MODE_NORMAL) {
			audioManager.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
			audioManager.setStreamVolume(AudioManager.STREAM_MUSIC
					, context.getSharedPreferences("auto_alarm", 0).getInt("last_volume"
							,audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC)/2), 0);
			Toast.makeText(context, "自动切换到正常音量模式", Toast.LENGTH_LONG).show();
		}
	}
	
	private void switchToSilentMode(Context context) {
		AudioManager audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
		if (audioManager.getRingerMode()!=AudioManager.RINGER_MODE_VIBRATE) {
			SharedPreferences.Editor editor = context.getSharedPreferences("auto_alarm",0).edit();
			editor.putInt("last_volume", audioManager.getStreamVolume(AudioManager.STREAM_MUSIC));
			editor.commit();
			audioManager.setRingerMode(AudioManager.RINGER_MODE_VIBRATE);
			Toast.makeText(context, "自动切换到振动模式", Toast.LENGTH_LONG).show();
		}
		audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0);
	}
}
