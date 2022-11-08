package test;

public class Memo1108 {

}

/* controller -> view (JSP)
 * controller는 servlet 요청이 일단 controller로 다 들어감 (요청이 jsp로 들어가면 안됨!)
 * C는 데이터를 받아서  
 * 요청 처리 후 해당되는 view에 분배 시킴
 * 
 * 1. 제어코드 이동 =>제어권을 넘김 
 * 2. 요청 연장 request extension =>요청이 바로 JSP로 가지 않고 controller를 거쳐 요청이 들어감(같은요청)
 * 3. 요청 분배 request dispatch =>JSP로 코드가 넘어감
 * 4. forward 요청을 forward
 * 
 * forward 내부 서블릿에서 JSP로 이동	 <-두가지는 비교대상이 아님! 완전히 다른 기술 리퀘스트가 연장되는것
 * redirect 브라우저로 바로 응답 
 */
