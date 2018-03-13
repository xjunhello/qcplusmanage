package com.framework;

/**
 * 
* @ClassName: Triple 
* @Description: Triple数据类型
* @author xinjun.zhang
* @date 2016年10月17日 上午9:18:06 
* 
* @param <L>
* @param <M>
* @param <N>
 */
public class Triple<L,M,N> {
	private L first;
	private M second;
	private M third;
	public L getFirst() {
		return first;
	}
	public void setFirst(L first) {
		this.first = first;
	}
	public M getSecond() {
		return second;
	}
	public void setSecond(M second) {
		this.second = second;
	}
	public M getThird() {
		return third;
	}
	public void setThird(M third) {
		this.third = third;
	}
	public Triple(L first, M second, M third) {
		super();
		this.first = first;
		this.second = second;
		this.third = third;
	}

	
	
}
