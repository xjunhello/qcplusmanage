package com.framework;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.ckfinder.connector.utils.FileUtils;
import com.qc.controller.UserController;

/**
 * 
 * @ClassName: UploadHelper
 * @Description: qcplus 上传辅助类 1：根据上传的类型，指定上传路径， 2：校验文件类型，大小， 3：校验上传权限， 4：完成上传操作，
 *               5：出错抛出BusinessException，正常则返回文件服务器上的相对路径
 * @author xinjun.zhang
 * @date 2016年10月26日 下午3:11:54
 *
 */
public class UploadHelper {


	private final static Logger logger = Logger.getLogger(UploadHelper.class);
	/**
	 * 
	* @Title: writeToFile 
	* @Description: 根据文件类型将文件写入
	* @param @param type
	* @param @param filename
	* @param @param input
	* @param @param overwrite
	* @param @return
	* @param @throws BusinessException    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public static String writeToFile(UploadType type, String filename,
			InputStream input, boolean overwrite,Integer userid,String orderCode,String reportCode) throws BusinessException {
		Pair<String,String> path = UploadType.generateSavePath(type,filename, userid, orderCode, reportCode);
		 writeToFile(path.getSecond(),input,overwrite);
		return path.getFirst();
	}
	/**
	 * 根据相对路径删除文件
	 * @param relativePath
	 * @return
	 * @throws BusinessException
	 */
	public static boolean delete(String relativePath) throws BusinessException {
		File file = new File(UploadType.ROOT_DIRTECTORY+File.separator+relativePath);
		if(file.isFile()){
			return FileUtils.delete(file);
		}else{
			//TODO 删除目录操作比较敏感 需要细化
			return false;
		}
		
	}
	
	public static void main(String[] args){
		File file = new File("d:\\test\\hello\\the\\world\\ni\\hao\\shi\\jie");
		File file1 = new File("d:\\test\\hello\\to\\world\\ni\\hao\\shi\\jie");
		checkParent(file);
		checkParent(file1);
	}
	/**
	 * 
	* @Title: checkdirectory 
	* @Description: 检查路径 没有则建立 
	* @param @param file    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public static void checkParent(File file) {
		if (file.getParentFile().exists()) {
			System.out.println(file.getParentFile().getAbsolutePath() +" : exists , jump it.");
			return ;
		} else {
			checkParent(file.getParentFile());
			file.getParentFile().mkdir();
			System.out.println(file.getParentFile().getAbsolutePath() +" : not exists , create it.");
		}
	}
	/**
	 * @throws BusinessException
	 * 
	 * @Title: writeToFile
	 * @Description: 将数据写入文件
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public static void writeToFile(String path,
			InputStream input, boolean overwrite) throws BusinessException {
		File file = new File(path);
		if(file.exists()&&file.isDirectory()){
			throw new BusinessException("上传失败", "路径错误！");
		}
		if (overwrite) {
			file.delete();
		} else {
			if (file != null && file.exists()) {
				throw new BusinessException("上传失败", "文件已存在！");
			}
		}

		try {
			checkParent(file);
			file.createNewFile();
			FileOutputStream fos = new FileOutputStream(file);
			byte[] cache = new byte[1024];
			while (input.read(cache) != -1) {
				fos.write(cache);
			}
			fos.flush();
			fos.close();
			input.close();
		} catch (IOException e) {
			logger.error("写入文件失败", e);
			throw new BusinessException("上传失败", "写入文件失败！");
		}
	}

	public static boolean isExists(String path) {
		File file = new File(path);
		if (file != null && file.exists())
			return true;
		else
			return false;
	}

	public static boolean isDirectory(String path) {
		File file = new File(path);
		if (file != null && file.exists() && file.isDirectory())
			return true;
		else
			return false;
	}

	public static String getBase64Image(String path) {
		File file = new File(path);
		if (file != null && file.exists() && file.isDirectory()) {
			Base64 base64 = new Base64();
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);
				byte[] orginData = new byte[fis.available()];
				fis.read(orginData);
				String resultStr = base64.encodeAsString(orginData);
				return resultStr;
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (fis != null) {
					try {
						fis.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return null;
	}

	
//	public static boolean fileTypeValid(String type, String path) {
//		return true;
//	}

	public static Writer getWriterForResponse(String path,
			HttpServletResponse response) throws IOException {
		return response.getWriter();
	}

	public static String getFileNameExtension(String path) {
		if(StringUtils.isEmpty(path))
			return path;
		path = path.substring(path.lastIndexOf(".")+1);
		return path;
	}

	public static String getFileNameWithoutExtension(String path) {
		if(StringUtils.isEmpty(path))
			return path;
		path = path.substring(0,path.lastIndexOf("."));
		return path;
	}

//	public static String restoreThumbnail(String path) {
//		return null;
//	}
}
