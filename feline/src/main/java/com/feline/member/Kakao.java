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
		private static final String Redirect_URL = "http://192.168.30.182:8080/feline/member/kakaoCallback.cat";

		// HOST
		private static final String keyHost = "https://kauth.kakao.com";
		
		// TODO : CODE �ޱ�
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
		
		// TODO : ����� ��ū �ޱ�
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
				// 1.URL ��ü ����
				URL url = new URL(accesstoken);
				// 2.�ش� URL�� URL.openConnection() �޼��带 ���ؼ�,
				// HttpURLConnection ���� ��ü�� �����Ͽ� url�� �����մϴ�.
				urlconn = (HttpURLConnection) url.openConnection();
				// 3. url ���� �� http ������� ��û�ϱ� ���ؼ��� īī������ ������ ������� ��û�Ѵ�.
				urlconn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				// īī����(Response) : Content-Type : application/json;charset=UTF-8
				// 4.POST������� ��û�ϱ�
				urlconn.setRequestMethod("POST");
				// 5.��û�� ���� �о�ð��̴�. true�� ����.
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
				// URL�� �ùٸ��� ������
				e.printStackTrace();
			} catch (IOException e) {
				// ������ ���� ���� ���
				e.printStackTrace();
			}
			return returnresult;
		}

		// TODO :JSON ������ ��������
		public static Map<String, String> JsonStringMap(String data) {
			// 1. map�� ��Ƽ� �������ֱ� ���ؼ� map ����
			Map<String, String> map = new HashMap<String, String>();

			// 2. ObjectMapper ��ü ����
			// ObjectMapper�� readValue()�� ���ؼ� Json�����͸� ��ȯ���� �� ��.
			ObjectMapper mapper = new ObjectMapper();

			try {
				// 3. �޾ƿ� data�� TypeReference�� ���ؼ� map���� ��ȭ������ �ڿ�
				// mapper.readValue�� ���ؼ� map�� ����
				map = mapper.readValue(data, new TypeReference<HashMap<String, String>>() {
				});
				// 4. ����ó��
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 5.data�� map���ٰ� ������ �Ϸ� �Ǿ����Ƿ� map ����
			return map;
		}

		// TODO : ��û�� �� �о����
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
