package com.example.classtable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RadioGroup;

public class Query extends Activity {
	
	private RadioGroup group;
	private ListView list; 
	private Button back;
	private final List<Integer> ids = Arrays.asList(R.id.monday,R.id.tuesday
						,R.id.wednesday,R.id.thursday,R.id.friday);
	private List<String> info; 
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.query);
		
	    group = (RadioGroup) findViewById(R.id.weekdays);
		list = (ListView) findViewById(R.id.class_info);
		back = (Button) findViewById(R.id.back);
		info = new ArrayList<String>();
		
		int today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		if (today>=2 && today<=6)
			group.check(ids.get(today-2));
		else
			group.check(ids.get(0));
		group.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
			@Override
			public void onCheckedChanged(RadioGroup group, int checkedId) {
				showInfo(checkedId);
			}
		});
		
		back.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				finish();
			}
		});
	}
	
	@Override 
	protected void onStart() {
		super.onStart();
		showInfo(group.getCheckedRadioButtonId());
	}
	
	private void showInfo(int checkedId) {
		SQLiteDatabase db = new DBHelper(Query.this).getReadableDatabase();
		Cursor cursor = db.query("TABLE_MAIN", new String[]{"DAY_ORDER","CLASSNAME","CLASSROOM"}
			, null, null, null, null, null);
		try {
			int weekday = ids.indexOf(checkedId)+1;
			info.clear();
			if (cursor.moveToPosition(5*(weekday-1))) {
				do {
					String class_info = cursor.getString(1);
					if (!class_info.equals("")) 
						class_info += "\t\t"+cursor.getString(2);
					else
						class_info = "Ã»¿Î";
					info.add(class_info);
					int choice = cursor.getInt(0)%10;
					if (choice == 5) break;
					if (choice == 2 || choice == 4) 
						info.add("");
				} while (cursor.moveToNext());
			}
		} finally {
			cursor.close();
		}
		db.close();
		list.setAdapter(new ArrayAdapter<String>(Query.this,R.layout.list_unit,info));
	}
}
