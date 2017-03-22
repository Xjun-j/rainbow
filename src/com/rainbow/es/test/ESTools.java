package com.rainbow.es.test;

import java.net.InetAddress;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
public class ESTools {
	
	public final static Client client =  build();
	
	/**
	 * 创建一次
	 * @return
	 */
	private static Client build(){
		if(null != client){
			return client;
		}
		Client client = null;
		String ip = "192.168.1.250";
		try {
			Settings settings = Settings
				.settingsBuilder()
					.put("cluster.name","sojson-application")
						.put("client.transport.sniff", true)
							.build();
			client = TransportClient.builder().settings(settings).build()
			.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(ip), 9300));
		} catch (Exception e) {
		}
		return client;
	}
	
	/**
	 * 关闭
	 */
	public static void close(){
		if(null != client){
			try {
				client.close();
			} catch (Exception e) {
				
			}
		}
	}
	
}