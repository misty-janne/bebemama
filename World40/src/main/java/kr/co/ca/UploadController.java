package kr.co.ca;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.co.utils.Utils;

@Controller
public class UploadController {

	private String uploadPath = "C:"+File.separator+"upload";
	
	@RequestMapping(value = "/uploadform", method = RequestMethod.POST)
	public void uploadform(MultipartHttpServletRequest request, Model model) throws Exception {
		MultipartFile file = request.getFile("file");
//											└jsp name = "file"
		/*
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType()); */
		
		
//		File target = new File("C:"+File.separator+"upload", file.getOriginalFilename());
//		File target = new File("C:"+File.separator+"upload", Utils.makeNewName(file.getOriginalFilename()));

		String originalName = file.getOriginalFilename();

		String fileName = Utils.saveFile(originalName, file, uploadPath);
		model.addAttribute("fileName", fileName);
			
		//이하 메서드처리
	}
	
	@RequestMapping(value = "/uploadform", method = RequestMethod.GET)
	public void uploadform() {
		
	}

}
