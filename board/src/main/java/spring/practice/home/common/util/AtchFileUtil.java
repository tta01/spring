package spring.practice.home.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.common.service.AtchFileService;
import spring.practice.home.common.vo.AtchFileVO;

@Slf4j
@Component
public class AtchFileUtil {
	
	@Resource
	String uploadFolder;
	
	@Resource
	AtchFileService atchFileService;
	
	
	public int uploadFile(MultipartFile[] uploadFile, String atchFileId) {

		log.info("## uploadFile ##");
		int result = 0;

		log.info("uploadFolder : " + uploadFolder);
		log.info("getFolder() : " + getFolder());
		
		// 업로드 경로 bean으로 넣어놔서 가져옴
		File uploadPath = new File(uploadFolder, getFolder());

		log.info("uploadPath : " + uploadPath);
		log.info("uploadPath.exists() : " + uploadPath.exists());

		// 업로드 경로에 파일 없으면 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		int i = 0;
		
		//1) ATCH_FILE 데이터 삭제 후?? 요고 확인해야함
		
		for (MultipartFile multipartFile : uploadFile) {
			
			// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
			if(multipartFile.getOriginalFilename().length() < 1) {
				break;
			}
			
			AtchFileVO atchVO = new AtchFileVO();
			
			if(i == 0) {
				atchVO.setAfId(atchFileId);
				int a = this.atchFileService.insertFile(atchVO);
				log.info("a : " + a);
				i++;
			}
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("나 uploadFileName : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("여기에 uploadFileName : " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);

			try(FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "t_" + uploadFileName))) {
				multipartFile.transferTo(saveFile);
				
				log.info("있어~~~");

				AtchFileVO atchFileVO = new AtchFileVO();

				atchFileVO.setAfId(atchFileId);

				atchFileVO.setAfSeq(0);

				atchFileVO.setAfSavePath(uploadPath + "/" + uploadFileName);
				// 폴더 역슬래시 확인하기
				atchFileVO.setAfSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

				atchFileVO.setAfOriginNm(multipartFile.getOriginalFilename());

				atchFileVO.setAfExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

				atchFileVO.setAfFileSize(multipartFile.getSize());

			} catch (IllegalStateException | IOException e) {

				log.error(e.getMessage());
			}
		}
		return result;
	}
	
	public String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

}
