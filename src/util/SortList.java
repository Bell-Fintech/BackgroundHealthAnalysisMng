package HealthAnalysisMng.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import HealthAnalysisMng.model.ChartJson;

public class SortList<E> {
	public void Sort(List<E> list, final String method, final String sort) {
		Collections.sort(list, new Comparator() {
			public int compare(Object a, Object b) {
				int ret = 0;
				try {
					Method m1 = ((E) a).getClass().getMethod(method, null);
					Method m2 = ((E) b).getClass().getMethod(method, null);
					if (sort != null && "desc".equals(sort)) {
						// 倒序
						ret = m2.invoke(((E) b), null).toString()
								.compareTo(m1.invoke(((E) a), null).toString());
					} else {
						// 正序
						ret = m1.invoke(((E) a), null).toString()
								.compareTo(m2.invoke(((E) b), null).toString());
					}
				} catch (NoSuchMethodException ne) {
				} catch (IllegalAccessException ie) {
				} catch (InvocationTargetException it) {
				}
				return ret;
			}
		});
	}
	private static List<ChartJson> mySort(List arr) { // 交换排序->冒泡排序  
		ChartJson temp = null;  
        boolean exchange = false;  
        for (int i = 0; i < arr.size(); i++) {  
            exchange = false;  
            for (int j = arr.size() - 2; j >= i; j--) {  
                if (((ChartJson) arr.get(j + 1)).getY().compareTo(  
                        ((ChartJson) arr.get(j)).getY()) >= 0) {  
                    temp = (ChartJson) arr.get(j + 1);  
                    arr.set(j + 1, (ChartJson) arr.get(j));  
                    arr.set(j, temp);  
                    exchange = true;  
                }  
            }  
            if (!exchange)  
                break;  
        }  
        return arr;  
    } 
}
