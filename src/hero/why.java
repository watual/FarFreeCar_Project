package hero;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
 
public class why extends JFrame implements Runnable, ActionListener {

 ImageIcon image1;

 JLabel lb;
 why() {
  init();
  setTitle("exam");
  setSize(300, 600); // 창 크기
  setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 종료버틍 활성화
  setVisible(true); // 화면에 보이기
  setResizable(true); // 프레임 크기 고정
 }

 public void init() {
  //Panel p = new Panel();
  image1 = new ImageIcon("img/img.jpg");  //이미지 경로
  lb = new JLabel("이미지를 넣자",image1,JLabel.CENTER);
  lb.setVerticalTextPosition(JLabel.CENTER);
  lb.setHorizontalTextPosition(JLabel.RIGHT);
 add(lb);
}

 @Override
 public void run() { // 스레드 정의부분
 }

 @Override
 public void actionPerformed(ActionEvent e) { // 액션이벤트
  Object obj = e.getSource();
   /*
   * if((JButton)obj == ok){ System.out.println("클릭"); }
   */
 }
 public static void main(String[] args){
  why exam = new why();
 }
}