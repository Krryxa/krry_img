package img;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

/**
 * 实现Java开发图像裁剪系统工具类
 * @author Krry
 * @version 1.0
 *
 */
public class CutImgTool {
	
	/**
	 * 图像裁剪工具类
	 * @param srcPath 原图片的路径
	 * @param targetPath  裁剪以后的图片路径
	 * @param x  坐标
	 * @param y 坐标
	 * @param width 宽度
	 * @param height 高度
	 */
	public static void cutImg(String srcPath,String targetPath,int x,int y,int width,int height){
		
		FileInputStream fis = null;
		ImageInputStream iis = null;
		try {
			//读取图片文件，建立文件输入流
			fis = new FileInputStream(srcPath);
			//创建图片文件流的迭代器
			java.util.Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName("jpg");
			ImageReader reader = it.next();
			//获取图片流，建立图片文件输入流
			iis = ImageIO.createImageInputStream(fis);
			reader.setInput(iis, true);
			//获取图片的参数
			ImageReadParam irp = reader.getDefaultReadParam();
			
			//定义裁剪区域
			Rectangle rect = new Rectangle(x, y, width, height);
			irp.setSourceRegion(rect);
			
			BufferedImage bi = reader.read(0, irp);
			
			//保存图片
			ImageIO.write(bi, "jpg", new File(targetPath));
			System.out.println("裁剪成功");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("裁剪失败");
		}finally{
			if(fis != null){
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(iis != null){
				try {
					iis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}
