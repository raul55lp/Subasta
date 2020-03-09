package com.subasta.rest;

import java.io.IOException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/webSocketPujas")
public class WebSocketPujas {
  
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("onOpen::" + session.getId());        
    }
    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose::" +  session.getId());
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("onMessage::From=" + session.getId() + " Message=" + message);
        
        try {
        	for (Session openSession : session.getOpenSessions()) {
    			openSession.getBasicRemote().sendText("Hello Client " + session.getId() + "!");
    			openSession.getBasicRemote().sendText("Hola DAW dual, paso tu mensaje a mayúsculas "+message.toUpperCase());
    		}
//            session.getBasicRemote().sendText("Hello Client " + session.getId() + "!");
//            session.getBasicRemote().sendText("Hola DAW dual, paso tu mensaje a mayúsculas "+message.toUpperCase());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
}