package spring.practice.home.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.RandomStringUtils;
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
	
	/** 컨트롤러 jsp 다 따로 만들고, c:import로 넣어주고, 파일id를 파라미터로 주고 받게끔  c에서 넘겨주젝ㄱ제1!!*/
	
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
			
		for (MultipartFile multipartFile : uploadFile) {
			
			// upload한 파일의 이름이 1보다 작다(없다) => 파일이 존재하지 않는다
			if(multipartFile.getOriginalFilename().length() < 1) {
				break;
			}
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("파일 uploadFileName : " + uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			log.info("여기에 uploadFileName : " + uploadFileName);
			
			File saveFile = new File(uploadPath, uploadFileName);

			try(FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "t_" + uploadFileName))) {
						multipartFile.transferTo(saveFile);
				
				log.info("있어~~~");

				AtchFileVO atchFileVO = new AtchFileVO();

				log.info(" @@@ atchFileId : " + atchFileId);
				atchFileVO.setAfId(atchFileId);

				atchFileVO.setAfSeq(0);

				atchFileVO.setAfSavePath(uploadPath + "/" + uploadFileName);

				atchFileVO.setAfSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

				atchFileVO.setAfOriginNm(multipartFile.getOriginalFilename());

				atchFileVO.setAfExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));

				atchFileVO.setAfFileSize(multipartFile.getSize());
				
				atchFileVO.setUseYn("Y");
				log.info(" @@@@@ file setUseYn : " + atchFileVO.getUseYn());

				log.info(" @@@@@ file atchFileVO : " + atchFileVO);
				
				// 파일 생성
				result += this.atchFileService.insertFile(atchFileVO);

				log.info(" @@@@@ file result : " + result);
				
			} catch (IllegalStateException | IOException e) {

				log.error(e.getMessage());
			}
		}
		return result;
	};
	
	// 파일 수정시
	public int uploadFileUpdate(MultipartFile[] uploadFile, String atchFileId) {
		// 파일이 업로드 될 경로
		
		String uploadFileName = "";
		log.info("uploadFileUpdate -> uploadFolder : " + uploadFolder);
		
		int result = 0;
		
		// 연월일 폴더 만들기 
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);
		
		//만약 연/월/일 해당 폴더가 없으면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//연월일 폴더 만들기 끝/////////////////////
		
		//uploadFile : MultipartFile[] uploadFile
		//uploadFile[0] : MultipartFile 1개
//		if(uploadFile[0].getOriginalFilename().length()>0) {
	    if(uploadFile != null && uploadFile.length > 0 && uploadFile[0].getOriginalFilename().length() > 0) {
		//ATCH_FILE_DETAIL 테이블의 데이터를 삭제
			this.atchFileService.deleteFile(atchFileId);
			
			//파일객체배열로부터 파일을 하나씩 꺼내보자
			for(MultipartFile multipartFile : uploadFile) {
					log.info("-------------------");
					log.info("파일명 : " + multipartFile.getOriginalFilename());
					log.info("크기 : " + multipartFile.getSize());
					log.info("MIME타입 : " + multipartFile.getContentType());
					
					//파일명
					uploadFileName = multipartFile.getOriginalFilename();
					
					// 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작//////////////
					//java.util.UUID => 랜덤값 생성
					UUID uuid = UUID.randomUUID();	//임의의 값을 생성
					//원래의 파일 이름과 구분하기 위해서 _를 붙임
					uploadFileName = uuid.toString() + "_" + uploadFileName;
					// 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝//////////////
					
					//File 객체 설계(복사할 대상 경로, 파일명)`
					//uploadPath : 연월일 처리된 경로
					//uploadFileName : uuid 처리된 파일명
					File saveFile = new File(uploadPath, uploadFileName);
					
					try {
						//파일 복사가 일어남
						//파일객체.transferTo(설계)
						multipartFile.transferTo(saveFile);
						
						//ATCH_FILE insert
						AtchFileVO atchFileVO = new AtchFileVO();
						
						atchFileVO.setAfId(atchFileId);

						atchFileVO.setAfSeq(0);

						atchFileVO.setAfSavePath(uploadPath + "\\" + uploadFileName);

						atchFileVO.setAfSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);

						atchFileVO.setAfOriginNm(multipartFile.getOriginalFilename());

						atchFileVO.setAfExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
						
						atchFileVO.setAfFileSize(multipartFile.getSize());
						
						atchFileVO.setUseYn("Y");
						
						log.info("atchFileVO : " + atchFileVO);
						
						//쿼리 실행
						result += this.atchFileService.insertFile(atchFileVO);
					} catch (IllegalStateException | IOException e) {
						log.error(e.getMessage());
					}
			}//end for
		}//end if
		
		return result;
		}
	
	// 폴더 년월일로 생성
	public String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	// 파일 ID 저장할 랜덤이름 : 년월일_랜덤
	public String getSaveAfId() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		String str = sdf.format(date);
		
		// count, letters, numbers => boolean 으로(true&false)
		String rnd = RandomStringUtils.random(10, true, true);
		String saveNm = str+ "_" + rnd;
		
		return saveNm;
	}

}
