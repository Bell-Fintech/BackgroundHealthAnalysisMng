package HealthAnalysisMng.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**定义日期时间段，方便检测日期
 * @author brave Han
 * */
public class DateUtils {

	/**
	 * 默认
	 * 时间格式
	 * */
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	/**
	 * 输入两个字符型日期返回2个日期间的day
	 * */
	public static int gapDays(String d1, String d2){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);
		Date date1 = null;
		Date date2 = null;
		try {
			date1 = simpleDateFormat.parse(d1);
			date2 = simpleDateFormat.parse(d2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int days = (int)((date2.getTime()-date1.getTime())/1000/60/60/24)+1;
		return days;
	}
	/**
	 * 把Date格式转成字符日期
	 * 重载方法单参数按照默认格式转化
	 * */
	public static String dateToFormat(Date date){
		return dateToFormat(date, "yyyy-MM-dd");
	}
	/**
	 * 根据获取当前时间周，（今年的第几周）计算前一周和当前周的时间差
	 * */
	public static String weekBeforeFormat(){
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR)-1);
		return dateToFormat(calendar.getTime());
	}
	/**
	 * @overload
	 *  传时间和时间格式，按照这个格式转化成字符型时间
	 * 
	 * */
	public static String dateToFormat(Date date, String format){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(date);
	}
	/**
	 * 把字符串时间根据默认格式转成Date类型
	 * */
	public static Date formatToDate(String date){
		return formatToDate(date, "yyyy-MM-dd");
	}
	/**
	 * 计算当前字符串时间日期，推算一天以后的时间然后转成字符时间
	 * */
	public static String afterDay(String date){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calender = Calendar.getInstance();
		Date date1 = null;
		try {
			date1 = simpleDateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calender.setTime(date1);
		calender.set(Calendar.DAY_OF_MONTH, calender.get(Calendar.DAY_OF_MONTH)+1);
		return simpleDateFormat.format(calender.getTime());
	}
	/**
	 * 计算当前字符串时间日期，推算一天以前的时间然后转成字符时间
	 * */
	public static String beforeDay(String date){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calender = Calendar.getInstance();
		Date date1 = null;
		try {
			date1 = simpleDateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calender.setTime(date1);
		calender.set(Calendar.DAY_OF_MONTH, calender.get(Calendar.DAY_OF_MONTH)-1);
		return simpleDateFormat.format(calender.getTime());
	}
	/**
	 * 把字符时间安照，自定义规则转成Date类型
	 * */
	public static Date formatToDate(String date, String format){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		try {
			return simpleDateFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
