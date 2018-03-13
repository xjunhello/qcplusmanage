package com.framework;

import java.util.List;
import java.util.Map;
/**
 * 
* @ClassName: PageList 
* @Description: 分页结构
* @author xinjun.zhang
* @date 2016年10月17日 上午9:19:27 
* 
* @param <T>
 */
public class PageList<T> {
 
	/**
	 * 当前页码
	 */
    private int pageNo;
    /**
     * 分页大小
     */
    private int pageSize;

	/**
     * 总记录数
     */
    private int totalSize;
    /**
     * 数据
     */
    private List<T> list;
    /**
     * 需要展示的页数
     */
    private int[] numbers;
    
    /**
     * 分页数
     */
    private int totalPage;
    /**
     * 页面的参数
     */
    private Map<String,Object> params  ;
    
    public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
    
    public int[] getNumbers() {
		return numbers;
	}

	public void setNumbers(int[] numbers) {
		this.numbers = numbers;
	}

	/**
     * 
    * <p>Title: </p> 
    * <p>Description: </p>
     */
    public PageList() {
        super();
    }
    /**
     * 
    * <p>Title: </p> 
    * <p>Description: </p> 
    * @param page 当前页码
    * @param rows 分页大小
    * @param total 总记录数
    * @param list 记录列表
     */
    public PageList(int page, int rows, int total, List<T> list) {
        super();
        this.pageNo = page;
        this.pageSize = rows;
        this.totalSize = total;
        this.list = list;
        this.setTotalPageValue(total);
    }
 

 
   
 
    public List<T> getList() {
        return list;
    }
 
    public void setList(List<T> list) {
        this.list = list;
    }
 
    public int size(){
        return null==list?0:list.size();
    }
 

 
	/**
	 * 设置显示页数集合
	 * @param totalPageCount
	 */
	private void setNumValues(int totalPageCount) {
		if (totalPageCount > 0) {
			int[] numbers = new int[totalPageCount > 5 ? 5 : totalPageCount];// 页面要显示的页数集合
			int k = 0;
			for (int i = 0; i < totalPageCount; i++) {
				// 保证当前页为集合的中间
				if ((i >= this.pageNo - (numbers.length / 2 + 1) || i >= totalPageCount - numbers.length)
						&& k < numbers.length) {
					numbers[k] = i + 1;
					k++;
				} else if (k >= numbers.length) {
					break;
				}
			}
			this.numbers = numbers;
		}
	}
	
	private void setTotalPageValue(int totalSize){
		if(totalSize<=0){
			this.totalPage=0;
		}
		this.totalPage = totalSize/this.pageSize+1;
        setNumValues(this.totalPage);
	}
}
