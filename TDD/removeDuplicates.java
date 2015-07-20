package com.removeDuplicates;

public class removeDuplicates {

	public int[] removeduplicates(int[] arr) {
		
		if(arr.length > 0)
		myfun(arr, 0, 1,(arr.length -1 )); 
		
		return arr;
	}
	
	
	public int[] myfun(int[] arr, int one, int two_start, int length){
		 
		//System.out.println("one is "+ one + "two is  " + two_start + "length is " + length);
		if(two_start != length){
			
			myfun(arr,two_start,two_start+1,length);
			
		}
		
		if(arr[one] == arr[two_start]){
			int i = two_start;
			
			while (i != (arr.length -1 )){
			
				arr[i] = arr[i+1];
				i++;
				
			}
			
			arr[i ] =0;
			
		}
		
		
		return arr;
		
	}
	
}
