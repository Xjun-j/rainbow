package com.rainbow.es.tool;


import java.net.InetAddress;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import com.rainbow.util.PropertiesUtil;


/**
 * 提供 ES client
 * 提供 增删改查ES 的方法 
 * CC 2016-05-28 
 */
public class EsClient {
	private static Log log = LogFactory.getLog(EsClient.class);
    //用于提供单例的TransportClient
    static public TransportClient tclient = null;

    //获取TransportClient 的方法
    public static TransportClient getClient() {
        try {
            if (tclient == null) {
            	Properties prop = PropertiesUtil.getProperty("es.properties");
//                String esHosts = "192.168.1.250:9300";
                String esHosts = prop.getProperty("es_host");
                String clusterName = prop.getProperty("es_cluster_name");
                Settings settings = Settings.settingsBuilder()
                        .put("cluster.name", clusterName)//设置集群名称
                        .put("tclient.transport.sniff", true).build();//自动嗅探整个集群的状态，把集群中其它机器的ip地址加到客户端中
                tclient = TransportClient.builder().settings(settings).build();
                String[] nodes = esHosts.split(",");
                for (String node : nodes) {
                	//跳过为空的node（当开头、结尾有逗号或多个连续逗号时会出现空node）
                    if (node.length() > 0) {
                        String[] hostPort = node.split(":");
                        tclient.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(hostPort[0]), Integer.parseInt(hostPort[1])));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("es client 创建失败！");
        }
        return tclient;
    }
    
    /**
     * 保存更新数据到ES
     */
    public static String Save(String index,String type,String id,String json){
    	IndexResponse response = getClient().prepareIndex(index, type,id ).setSource(json).get();
    	return response.toString();
    }
    
    
    public static void main(String[] args) {
    	//测试 添加文档
    	StringBuilder sb = new StringBuilder();
    	sb.append("{");
    	sb.append("\"title\":\"zootopia\",");
    	sb.append("\"category\":\"动画\",");
    	sb.append("\"type\":\"冒险\",");
    	sb.append("\"img_ur\":\"http://f.hiphotos.baidu.com/image/pic/item/7aec54e736d12f2eec17b2b54bc2d562843568d0.jpg\",");
    	sb.append("\"video_url\":\"www.baidu.com\",");
    	sb.append("\"radio\":\"2048\",");
    	sb.append("\"date\":\"2015\",");
    	sb.append("\"duration\":\"30\",");
    	sb.append("\"area\":\"美国\",");
    	sb.append("\"director\":\"拜伦·霍华德|里奇·摩尔\",");
    	sb.append("\"starring\":\"都是禽兽\",");
    	sb.append("\"introduction\":\"是一部美国华特迪士尼影业制作的3D电脑动画动作喜剧冒险电影,亦是第55部迪士尼经典动画长片\",");
    	sb.append("\"score\":\"9.7\",");
    	sb.append("\"viewers\":\"9828585\"");
    	sb.append("}");
    	
    	String json = sb.toString();
    	System.out.println(json);
    	IndexResponse response = getClient().prepareIndex("vr", "video","100000000000000003" ).setSource(json).get();
    	System.out.println(response.toString());
    	
    	
	}
    
}