package com.subasta.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.ws.rs.core.Context;

import com.subasta.Models.Usuario;
import com.subasta.servicios.ServicioPuja;

@ServerEndpoint("/webSocketPujas")
public class WebSocketPujas {

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen::" + session.getId());
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose::" + session.getId());
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println(message);
		String[] mensaje= message.split(":");
		Double precio =Double.parseDouble(mensaje[0]);
		String correo = mensaje[1];
		Integer articulo=Integer.parseInt(mensaje[2]);
		try {
			if (!correo.isEmpty()) {
				ServicioPuja sp = new ServicioPuja();
				if(sp.Pujar(articulo, correo, precio)) {
					for (Session openSession : session.getOpenSessions()) {
						openSession.getBasicRemote().sendText(precio+"€");
					}
				}else {
					session.getBasicRemote().sendText("La puja no está disponible");
				}
			} else {
				session.getBasicRemote().sendText("Necesitas estar registrado para poder hacer una puja");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Throwable t) {
		System.out.println("onError::" + t.getMessage());
	}
}