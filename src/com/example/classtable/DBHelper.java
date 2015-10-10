package com.example.classtable;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DBHelper extends SQLiteOpenHelper {
	
	private static final int DATABASE_VERSION = 6;
	private static final String DATABASE_NAME = "classtable.db";
	private static final String TABLE_CREATE_DDL = "CREATE TABLE TABLE_MAIN ("
										+"DAY_ORDER INTEGER PRIMARY KEY,"
							+"CLASSNAME TEXT,CLASSROOM TEXT,TEACHER TEXT);"; 
	private static final String TABLE_CREATE_DDL_2 = "CREATE TABLE TIME_TABLE ("+"ID INTEGER PRIMARY KEY,"
							+"HOUR INTEGER,MINUTE INTEGER);";
	private final String TABLE_DELETE_DDL = "DROP TABLE IF EXISTS TABLE_MAIN;";
	private final String TABLE_DELETE_DDL_2 = "DROP TABLE IF EXISTS TIME_TABLE;";
	
	public DBHelper(Context context) {
		super(context,DATABASE_NAME,null,DATABASE_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase arg0) {
		arg0.execSQL(TABLE_CREATE_DDL);
		arg0.execSQL(TABLE_CREATE_DDL_2);
	}

	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		arg0.execSQL(TABLE_DELETE_DDL);
		arg0.execSQL(TABLE_DELETE_DDL_2);
		arg0.execSQL(TABLE_CREATE_DDL);
		arg0.execSQL(TABLE_CREATE_DDL_2);
	}

}
