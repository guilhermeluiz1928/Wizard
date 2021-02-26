package br.com.wizard.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	public Time convHora(String hora) {
		Time horaConvertida = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			Date data = format.parse(hora);
			horaConvertida = new Time(data.getTime());
		} catch (ParseException e) {
			System.out.println("Erro ao converter a hora! Erro: " + e);
		}
		return horaConvertida;
	}

	public java.sql.Date convData(String data) {
		java.sql.Date dataConvertida = null;
		try {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			dataConvertida = new java.sql.Date(format.parse(data).getTime());
			// dataConvertida = new java.sql.Date(
			// ((java.util.Date)format.parse(data)).getTime());
		} catch (ParseException e) {
			System.out.println("Erro ao converter a data! Erro: " + e);
		}
		return dataConvertida;
	}

	public String encodeUrl(String parametro) {
		String parametroCovertido= null;
		try {			
			parametroCovertido = URLEncoder.encode(parametro, StandardCharsets.UTF_8.toString());
		} catch (UnsupportedEncodingException e) {
			System.out.println("Erro ao codificar a URL! Erro: " + e);
		}
		return parametroCovertido;
	}

}
