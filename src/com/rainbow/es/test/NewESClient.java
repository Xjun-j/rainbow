package com.rainbow.es.test;


import java.net.InetAddress;

import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

/**
 * ES Client 
 * 用于向ES 集群 写入 更新数据 等
 * 2016-05-31
 * cc
 */
public class NewESClient {

//用于提供单例的TransportClient BulkProcessor
    static public TransportClient tclient = null;
//    static BulkProcessor staticBulkProcessor = null;

//【获取TransportClient 的方法】
    public static TransportClient getClient() {
        try {
            if (tclient == null) {
                String EsHosts = "192.168.1.250:9300";
                Settings settings = Settings.settingsBuilder()
                        .put("cluster.name", "wuya")//设置集群名称
                        .put("tclient.transport.sniff", true).build();//自动嗅探整个集群的状态，把集群中其它机器的ip地址加到客户端中
                tclient = TransportClient.builder().settings(settings).build();
                String[] nodes = EsHosts.split(",");
                for (String node : nodes) {
                    if (node.length() > 0) {//跳过为空的node（当开头、结尾有逗号或多个连续逗号时会出现空node）
                        String[] hostPort = node.split(":");
                        tclient.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(hostPort[0]), Integer.parseInt(hostPort[1])));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tclient;
    }
     //【设置自动提交文档】
//    public static BulkProcessor getBulkProcessor() {
//        //自动批量提交方式
//        if (staticBulkProcessor == null) {
//            try {
//                staticBulkProcessor = BulkProcessor.builder(getClient(),
//                        new BulkProcessor.Listener() {
//                            @Override
//                            public void beforeBulk(long executionId, BulkRequest request) {
//                                //提交前调用
////                                System.out.println(new Date().toString() + " before");
//                            }
//
//                            @Override
//                            public void afterBulk(long executionId, BulkRequest request, BulkResponse response) {
//                                //提交结束后调用（无论成功或失败）
////                                System.out.println(new Date().toString() + " response.hasFailures=" + response.hasFailures());
//                                System.out.println( "提交" + response.getItems().length + "个文档，用时"
//                                        + response.getTookInMillis() + "MS" + (response.hasFailures() ? " 有文档提交失败！" : ""));
////                                response.hasFailures();//是否有提交失败
//                            }
//
//                            @Override
//                            public void afterBulk(long executionId, BulkRequest request, Throwable failure) {
//                                //提交结束且失败时调用
//                            	System.out.println( " 有文档提交失败！after failure=" + failure);
//                            }
//                        })
//                        .setBulkActions(1000)//文档数量达到1000时提交
//                        .setBulkSize(new ByteSizeValue(5, ByteSizeUnit.MB))//总文档体积达到5MB时提交 //
//                        .setFlushInterval(TimeValue.timeValueSeconds(5))//每5S提交一次（无论文档数量、体积是否达到阈值）
//                        .setConcurrentRequests(1)//加1后为可并行的提交请求数，即设为0代表只可1个请求并行，设为1为2个并行
//                        .build();
////                staticBulkProcessor.awaitClose(10, TimeUnit.MINUTES);//关闭，如有未提交完成的文档则等待完成，最多等待10分钟
//            } catch (Exception e) {//关闭时抛出异常
//                e.printStackTrace();
//            }
//        }//if
//        return staticBulkProcessor;
//    }
    
    public static void main(String[] args) {
//		String json = "{\"title\":\"boduoyejieyi\",\"category\":\"1\"}";
//		try { // EsClient.getBulkProcessor()是位于上方EsClient类中的方法
//			getBulkProcessor().add(new IndexRequest("cctest", "video", "1000002").source(json));// 添加文档，以便自动提交
//		} catch (Exception e) {
//			System.out.println("add文档时出现异常：e=" + e + " json=" + json);
//		}
    	StringBuilder sb = new StringBuilder();
    	sb.append("{");

    	sb.append("\"title\":\"波多野结衣的日常\",");
    	sb.append("\"category\":\"全景\",");
    	sb.append("\"type\":\"剧情\",");
    	sb.append("\"img_ur\":\"http://f.hiphotos.baidu.com/image/pic/item/7aec54e736d12f2eec17b2b54bc2d562843568d0.jpg\",");
    	sb.append("\"video_url\":\"www.baidu.com\",");
    	sb.append("\"radio\":\"1080\",");
    	sb.append("\"date\":\"2016\",");
    	sb.append("\"duration\":\"30\",");
    	sb.append("\"area\":\"日本\",");
    	sb.append("\"director\":\"未知导演\",");
    	sb.append("\"starring\":\"波多野结衣\",");
    	sb.append("\"introduction\":\"记录了结衣的生活日常与技术\",");
    	sb.append("\"score\":\"10.0\",");
    	sb.append("\"viewers\":\"1000000\"");
    	
    	sb.append("}");
    	
    	String json = sb.toString();
    	System.out.println(json);
    	IndexResponse response = getClient().prepareIndex("vr", "video","100000000000000002" ).setSource(json).get();
    	System.out.println(response.toString());
    	
    	
	}
    
}