package com.feline.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


public class Kakao {
		// REST API KEY
		private static final String RestApiKey = "4791a43e3d2c10da96766e98f07c423b";

		// redirect_uri
		private static final String Redirect_URL = "http://localhost:8080/feline/member/kakaoCallback.cat";

		// HOST
		private static final String keyHost = "https://kauth.kakao.com";
		
		// TODO : CODE 받기
		/*
		 * GET /oauth/authorize?client_id={app_key}&redirect_uri={redirect_uri}&
		 * response_type=code HTTP/1.1 Host: kauth.kakao.com
		 */
		public static String getCode() {
			String getcode = keyHost;
			getcode += "/oauth/authorize?client_id=" + RestApiKey;
			getcode += "&redirect_uri=" + Redirect_URL;
			getcode += "&response_type=code";

			return getcode;
		}
		
		// TODO : 사용자 토큰 받기
		public static String getAccesToken(String authorize_code) {

			/*
			 * curl -v -X POST https://kauth.kakao.com/oauth/token \ -d
			 * 'grant_type=authorization_code' \ -d 'client_id={app_key}' \ -d
			 * 'redirect_uri={redirect_uri}' \ -d 'code={authorize_code}'
			 */
			String getAccessToken = keyHost;
			getAccessToken += "/oauth/token?grant_type=authorization_code";
			getAccessToken += "&client_id=" + RestApiKey;
			getAccessToken += "&redirect_uri=" + Redirect_URL;
			getAccessToken += "&code=" + authorize_code;
			return getAccessToken;
		}
		
		
		public static String getHtml(String accesstoken) {
			HttpURLConnection urlconn = null;
			String returnresult = null;
			try {
				// 1.URL 객체 생성
				URL url = new URL(accesstoken);
				// 2.해당 URL에 URL.openConnection() 메서드를 통해서,
				// HttpURLConnection 접속 객체를 생성하여 url에 접속합니다.
				urlconn = (HttpURLConnection) url.openConnection();
				// 3. url 접속 후 http 방식으로 요청하기 위해서는 카카오톡이 지정한 방식으로 요청한다.
				urlconn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				// 카카오톡(Response) : Content-Type : application/json;charset=UTF-8
				// 4.POST방식으로 요청하기
				urlconn.setRequestMethod("POST");
				// 5.요청한 값을 읽어올것이다. true로 지정.
				urlconn.setDoOutput(true);
				// 6.Connect
				urlconn.connect();

				BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(), "UTF-8"));

				StringBuffer sb = new StringBuffer();

				String result = null;

				while ((result = in.readLine()) != null) {
					sb.append(result);
					sb.append("\n");
				}
				returnresult = sb.toString();

			} catch (MalformedURLException e) {
				// URL이 올바르지 않을때
				e.printStackTrace();
			} catch (IOException e) {
				// 연결이 실패 했을 경우
				e.printStackTrace();
			}
			return returnresult;
		}

		// TODO :JSON 데이터 가져오기
		public static Map<String, String> JsonStringMap(String data) {
			// 1. map에 담아서 리턴해주기 위해서 map 생성
			Map<String, String> map = new HashMap<String, String>();

			// 2. ObjectMapper 객체 생성
			// ObjectMapper의 readValue()를 통해서 Json데이터를 변환시켜 줄 것.
			ObjectMapper mapper = new ObjectMapper();

			try {
				// 3. 받아온 data를 TypeReference를 통해서 map으로 변화시켜준 뒤에
				// mapper.readValue를 통해서 map에 저장
				map = mapper.readValue(data, new TypeReference<HashMap<String, String>>() {
				});
				// 4. 예외처리
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 5.data를 map에다가 저장이 완료 되었으므로 map 리턴
			return map;
		}

		// TODO : 요청한 값 읽어오기
		public static String getAllList(String access_token) {
			HttpURLConnection urlconn = null;
			String returnresult = null;
			try {
				URL url = new URL("https://kapi.kakao.com/v1/api/talk/profile?access_token="+access_token);
				urlconn = (HttpURLConnection) url.openConnection();
				urlconn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				urlconn.setRequestMethod("POST");
				urlconn.setDoOutput(true);
				urlconn.connect();

				BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(), "UTF-8"));

				StringBuffer sb = new StringBuffer();

				String result = null;

				while ((result = in.readLine()) != null) {
					sb.append(result);
					sb.append("\n");
				}
				returnresult = sb.toString();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return returnresult;
		}
		
}
