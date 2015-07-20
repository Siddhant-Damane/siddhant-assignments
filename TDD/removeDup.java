package com.removeDuplicates;

import static org.junit.Assert.assertArrayEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class removeDup {

	private removeDuplicates r; 
	
	@Before
	public void init() {
		//System.out.println("Before");
		r = new removeDuplicates();
	}

	@After
	public void teardown() {
		//System.out.println("nothing to teardown");
	}
	
	@Test
	public void testduplcate() {
		int[] arr = new int[] { 1, 2, 3, 3, 4, 5,5,5,6 };
		int[] resultArr = r.removeduplicates(arr);
		
		assertArrayEquals(new int[] {1, 2, 3, 4, 5, 6,0,0,0},  resultArr);
	
	}

	@Test
	public void testAllDuplicate() {
		int[] arr = new int[] { 1, 1, 1, 1, 1, 1 };
		int[] resultArr = r.removeduplicates(arr);
		
		assertArrayEquals(new int[] {1,0,0,0,0,0},  resultArr);
	}

	@Test
	public void testNoDuplicates() {
		int[] arr = new int[] { 1, 2, 1, 3, 1, 5 };
		int[] resultArr = r.removeduplicates(arr);
		
		assertArrayEquals(new int[] { 1, 2, 1, 3, 1, 5 },  resultArr);
	}
	
	@Test
	public void testRemovalOnEmptyArr() {
		int[] arr = new int[0]; // { 1, 2, 1, 3, 1, 5 };
		int[] resultArr = r.removeduplicates(arr);
		
		assertArrayEquals(new int[0],  resultArr);
	}
	
	
}
