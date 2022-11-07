package test;

public class Memo1107 {

}

/* HTTP 
 * - 브라우저(클라이언트) 웹서버 연결(connect)-요청(request)-응답(response)-연결끝(close) 반복
 *       => 무상태연결 : 다시 요청이 들어오기 전까지 연결x 문서중심.. 계속 연결유지하면 낭비
 * - 웹 주소 보면 ? 앞까지가 url(프로그램) / ? 뒤에는 파라미터
 * - GET (READ) 링크 누르거나 주소를 직접 쳤을 때.. 용량한계있음(url 최대크기 지정되어있음) 파라미터와 값이 주소에 노출
 * 	사용이유 1. url 전달에 용이
 * - POST (CREATE) 폼에 데이터를 작성하고 보냈을 때 정보 크기에 한계없음 파라미터와 값이 바디에 숨겨짐 링크로 할 수 없음!!!! body는 용량 제한 업음
 * - DELETE (DELETE)
 * - PUT (UPDATE)
 * - 주소에 /이후로 자원(resource)의 위치
 * - 127.0.0.1:8080 = localhost:8080
 * - context path 
 * 
 * 현재는 이클립스가 메모리상에서 빌드-배포 수행해줌 실제 환경에서는 톰캣에 직접 파일을 올려줘야함
 * 
 * 정적 웹페이지 = publishing
 * 동적 웹페이지 = programming
 * 
 * 
 * html
 * - 문서의 내용을 구조적으로 표현
 * 
 * 
 *scriptlet -> JSTL/EL
 *<% %>
 *<%= %>
 *
 *Model => Dao
 *View => JSP
 *Controller => Servlet
 *
 *Model1=Model+1(JSP(V+C))
 *Model2=Model+2(JSP(V),Servlet(C)) => jsp는 view만 수행
 *
 *emaillist01
 *guestbook01
 *
 *emaillist02
 *guestbook02
 *
 *mysite02
 *
 *(spring)
 *emaillist03
 *guestbook03
 *
 *mysite03(Spring MVC, XML Configuration)
 *mysite04(Spring MVC, Java Class Configuration)
 *mysite05(Spring Boot, Java Class Configuration)
 *
 */