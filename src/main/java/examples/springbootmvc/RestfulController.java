package examples.springbootmvc;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/rest")
public class RestfulController {
	
	
	@GetMapping("/get")
	public RestResponse get(){
		
		UserInfo u = new UserInfo();
		u.setUserId("11111");
		u.setTimeStamp(new Date());
		u.setInfo("this is master test 3");
		
		RestResponse res = new RestResponse();
		res.setRetCode(0);
		res.setData(u);

		return res;
	}
	
}
