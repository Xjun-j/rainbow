package com.rainbow.es.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;

import sun.net.www.http.HttpClient;

public class EsClient {
	private Client client;
	 
    public void init() {
    	Settings settings = Settings.settingsBuilder()  
                //指定集群名称  
                .put("cluster.name", "elasticsearch")  
                //探测集群中机器状态  
                .put("client.transport.sniff", true).build();  

    	  client = TransportClient.builder().settings(settings).build(); 
    }
 
    public void close() {
        client.close();
    }
 
    /**
     * index
     */
    public void createIndex() {
        for (int i = 0; i < 1000; i++) {
            User user = new User();
            user.setId(new Long(i));
            user.setName("huang fox " + i);
            user.setAge(i % 100);
            client.prepareIndex("users", "user").setSource(generateJson(user))
                    .execute().actionGet();
        }
    }
 
    /**
     * 转换成json对象
     *
     * @param user
     * @return
     */
    private String generateJson(User user) {
        String json = "";
        try {
            XContentBuilder contentBuilder = XContentFactory.jsonBuilder()
                    .startObject();
            contentBuilder.field("id", user.getId() + "");
            contentBuilder.field("name", user.getName());
            contentBuilder.field("age", user.getAge() + "");
            json = contentBuilder.endObject().string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return json;
    }
    
    
   
    
 
    public static void main(String[] args) {
//        EsClient client = new EsClient();
//        client.init();
//        client.createIndex();
//        client.close();
    	
    }
}
