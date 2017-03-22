package com.rainbow.es.test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

public class HttpURLConnectionExample  {

	    private final String USER_AGENT = "Mozilla/5.0";

	    public static void main(String[] args) throws Exception {

	        HttpURLConnectionExample http = new HttpURLConnectionExample();

//	        System.out.println("Testing 1 - Send Http GET request");
//	        http.sendGet();
//
//	        System.out.println("\nTesting 2 - Send Http POST request");
	        http.sendPost();
//	        
//	        BulkRequestBuilder bulkRequest = ESTools.client.prepareBulk().setRefresh(true);
//			Map resultMap = new HashMap();
//			
//			IndexRequestBuilder lrb = ESTools.client
//                    .prepareIndex("cctest", "video")
//                        .setSource("urlwwwwwwwwwwwwwwwwwwwwwwwww");
//					bulkRequest.add(lrb);
//			
//			BulkResponse bulkResponse = bulkRequest.execute().actionGet();
//			if (bulkResponse.hasFailures()) {
//				// process failures by iterating through each bulk response item
//				System.out.println(bulkResponse.getItems().toString());
//				resultMap.put("500", "保存ES失败!");
////				return resultMap;
//			}
//			bulkRequest = ESTools.client.prepareBulk();
//			resultMap.put("200", "保存ES成功!");
//			return resultMap;
			

	    }

	    // HTTP GET request
	    private void sendGet() throws Exception {
	        String url = "http://192.168.1.250:9200/_search";
	        URL obj = new URL(url);
	        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	        // optional default is GET
	        con.setRequestMethod("GET");
	        //add request header
	        con.setRequestProperty("User-Agent", USER_AGENT);

	        int responseCode = con.getResponseCode();
	        System.out.println("\nSending 'GET' request to URL : " + url);
	        System.out.println("Response Code : " + responseCode);

	        BufferedReader in = new BufferedReader(
	                new InputStreamReader(con.getInputStream()));
	        String inputLine;
	        StringBuffer response = new StringBuffer();

	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();

	        //print result
	        System.out.println(response.toString());

	    }

	    // HTTP POST request
	    private void sendPost() throws Exception {
	        String url = "http://192.168.1.250:9300/vr/video/10002/";
	        URL obj = new URL(url);
//	        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
	        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	        
	        //add reuqest header
	        con.setRequestMethod("PUT");
	        con.setRequestProperty("User-Agent", USER_AGENT);
	        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

	        String urlParameters = "{title:'波多野结衣',category:'剧情'}";
	        urlParameters = URLEncoder.encode(urlParameters,"utf-8");
	        // Send post request
	        con.setDoOutput(true);
	        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	        wr.writeBytes(urlParameters);
	        wr.flush();
	        wr.close();

	        int responseCode = con.getResponseCode();
	        System.out.println("Post parameters : " + urlParameters);
	        System.out.println("Response Code : " + responseCode);

	        BufferedReader in = new BufferedReader(
	                new InputStreamReader(con.getInputStream()));
	        String inputLine;
	        StringBuffer response = new StringBuffer();

	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();

	        //print result
	        System.out.println(response.toString());

	    }
}
