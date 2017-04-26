package kr.co.foot.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.services.analytics.AnalyticsScopes;

public class GetToken {
	
	private static final String KEY_FILE_LOCATION = "C:/Users/User/workspace/baljagook/src/main/java/kr/co/foot/util/My Project-5ab8f062c393.json";
	
	public GetToken(){
		
	}
	
	public String token() throws FileNotFoundException, IOException{
		GoogleCredential credential = GoogleCredential
			    .fromStream(new FileInputStream(KEY_FILE_LOCATION))
			    .createScoped(Collections.singleton(AnalyticsScopes.ANALYTICS_READONLY));
			credential.refreshToken();
			System.out.println(credential.getAccessToken());
			
			return credential.getAccessToken();
	}
}