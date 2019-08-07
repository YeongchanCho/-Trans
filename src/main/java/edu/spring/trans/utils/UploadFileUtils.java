package edu.spring.trans.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {


	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {

		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + File.separator + ymdPath;

		File target = new File(imgPath, newFileName);
		System.out.println("***** target: " + target);
		FileCopyUtils.copy(fileData, target);
		
//		File image = new File(imgPath + File.separator + newFileName);


		return newFileName;
	}

	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = String.valueOf(cal.get(Calendar.YEAR));
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);
		//makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		System.out.println("***** uploadPath: " + uploadPath);
		
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			System.out.println("***** path: " + path);
			File dirPath = new File(uploadPath, path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
