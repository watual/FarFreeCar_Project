package hero;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import hero.*;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Test1 {

	public static void main(String[] args) {

		// TODO Auto-generated method stub
		gameFrame3 fms = new gameFrame3();
	}

}

class gameFrame3 extends JFrame implements KeyListener, Runnable {

	boolean KeyUp = false;
	boolean KeyDown = false;
	boolean KeyLeft = false;
	boolean KeyRight = false;
	boolean KeyZ = false;
	boolean KeyC = false;
	boolean KeyX = false;
	boolean boom = true;
	boolean she = false;
	boolean bm_im = false;

	int[] cx = { 0, 0, 0 }; // 배경 스크롤 속도 제어용 변수
	int f_width;
	int f_height;
	int x, y;
	int shex, shey;
	int bx = 0; // 전체 배경 스크롤 용 변
	int cnt;
	int player_Speed; // 유저의 캐릭터가 움직이는 속도를 조절할 변수
	int missile_Speed; // 미사일이 날라가는 속도 조절할 변수
	int fire_Speed; // 미사일 연사 속도 조절 변수
	int enemy_speed; // 적 이동 속도 설정
	int boss_speed;
	int game_Score; // 게임 점수 계산
	int player_Hitpoint; // 플레이어 캐릭터의 체력
	int bsHP;
	int bsHP2 = 2000;
	int EnHP;
	int Player_life;
	int Boss_life;
	int Boss_Delay;
	int ms_plx;
	int ms_ply;
	int gamestart = 0;
	int bstime = 80;
	int time;
	int sheHP=300;
	int bti;
	int star=0;
	Thread th;
	Toolkit tk = Toolkit.getDefaultToolkit();
	Image[] Cloud_img; // 움직이는 배경용 이미지배열
	Image[] Explo_img; // 폭발이펙트용 이미지배열
	Image[] Explo2_img;
	Image buffImage;
	Image Player_img;
	Image BackGround_img; // 배경화면 이미지
	Image BackGround2_img;
	Image GameOver;
	Image Missile_img;
	Image Missile2_img;
	Image Enemy_img;
	Image Boss1_img;
	Image she_img;
	Image Boom_img;
	Image move_img;
	Image att_img;
	Image boomKey_img;
	Image shKey_img;
	Image cupon_img;
	ArrayList Missile_List = new ArrayList();
	ArrayList Enemy_List = new ArrayList();
	ArrayList Explosion_List = new ArrayList();
	ArrayList Explosion2_List = new ArrayList();
	ArrayList BoomExplo_List = new ArrayList();
	ArrayList Boss_List = new ArrayList();

	Graphics buffg;
	Missile ms;
	Boss bs;
	Enemy en;
	Explosion ex; // 폭발 이펙트용 클래스 접근 키
	BossExplo bex;
	JLabel lbl;

	gameFrame3() {
		init();
		start();

		setTitle("hero");
		setSize(f_width, f_height);

		Dimension screen = tk.getScreenSize();

		int f_xpos = (int) (screen.getWidth() / 2 - f_width / 2);
		int f_ypos = (int) (screen.getHeight() / 2 - f_height / 2);

		setLocation(f_xpos, f_ypos);
		setResizable(false);
		setVisible(true);

	}

	public void init() {
		x = 100;
		y = 100;
		f_width = 1200;
		f_height = 600;
		Player_life = 1;
		Boss_life = 1;
		Boss_Delay = 0;
		ms_plx = 50;
		ms_ply = 50;

		Missile_img = new ImageIcon("Image/gamege/bombsmall.png").getImage();
		Missile2_img = new ImageIcon("Image/gamege/BossM3.png").getImage();
		Enemy_img = new ImageIcon("Image/gamege/Enemy3.png").getImage();
		Player_img = new ImageIcon("Image/gamege/goldsmall.png").getImage();
		BackGround_img = new ImageIcon("Image/gamege/firstbackgroun.png").getImage();
		BackGround2_img = new ImageIcon("Image/gamege/firstbackgroun2.png").getImage();
		Boss1_img = new ImageIcon("Image/gamege/boss3.png").getImage();
		GameOver = new ImageIcon("Image/gamege/GameOver.png").getImage();
		she_img = new ImageIcon("Image/gamege/eggmid.png").getImage();
		Boom_img = new ImageIcon("Image/gamege/Boom.png").getImage();
		move_img = new ImageIcon("Image/moveKey.png").getImage();
		att_img = new ImageIcon("Image/attackKey.png").getImage();
		boomKey_img = new ImageIcon("Image/boomKey.png").getImage();
		shKey_img = new ImageIcon("Image/shielKey.png").getImage();
		cupon_img = new ImageIcon("Image/gamege/coupon_img.png").getImage();
		Cloud_img = new Image[3];
		for (int i = 0; i < Cloud_img.length; i++) {
			Cloud_img[i] = new ImageIcon("Image/gamege/Cloud22_" + i + ".png").getImage();
		}
		Explo_img = new Image[8];
		for (int i = 0; i < Explo_img.length; i++) {
			Explo_img[i] = new ImageIcon("Image/gamege/explo1_" + i + ".png").getImage();
		}
		Explo2_img = new Image[7];
		for (int i = 0; i < Explo2_img.length; i++) {
			Explo2_img[i] = new ImageIcon("Image/gamege/explo10_" + i + ".png").getImage();
		}
		game_Score = 0;// 게임 스코어 초기화
		player_Hitpoint = 5;// 최초 플레이어 체력
		bsHP = bsHP2;
		EnHP = 30;
		player_Speed = 8; // 유저 캐릭터 움직이는 속도 설정
		missile_Speed = 11; // 미사일 움직임 속도 설정
		fire_Speed = 15; // 미사일 연사 속도 설정
		enemy_speed = 7;// 적이 날라오는 속도 설정
		boss_speed = 3;
		
	}

	public void start() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		addKeyListener(this);
		th = new Thread(this);
		th.start();
	}

	public void run() {
		try {
			while (true) {
				if (gamestart == 1) {
					if (Player_life == 1) {
						KeyProcess();
						EnemyProcess();
						MissileProcess();
					}
					ExplosionProcess();// 폭파처리 메소드 실행
					BossExploProcess();
					if (Boss_life == 1) {
						for (int i = 0; i < Boss_List.size(); i++) {
							BossProcess();
						}
					}
					if(KeyC==false) {
						sheHP++;	
					}else {
						sheHP++;
						if(she == true) {
							sheHP -=2;
						}
					}
					
					cnt++;
					time++;
					shex = x-she_img.getWidth(null)/2+15;
					shey = y-she_img.getHeight(null)/2+13;
					if(sheHP <= 0) {
						she = false;
					}
					if(time == 300) {
						boom = true;
					}
				}
				repaint();
				Thread.sleep(20);
			}
		} catch (Exception e) {
		}
	}

	public void MissileProcess() {
		if (KeyZ) {
			ms = new Missile(x + 13, y + 1, missile_Speed, 0, 0);
			Missile_List.add(ms);
		}
		for (int i = 0; i < Missile_List.size(); i++) {
			ms = (Missile) Missile_List.get(i);
			ms.move();
			if (ms.x < -20 || ms.x > f_width - 20) {
				Missile_List.remove(i);
			}
			if (Crash(x, y, ms.x, ms.y, Player_img, Missile_img) && (ms.who == 1 || ms.who == 4 )) {
				if(KeyC == false) {
					player_Hitpoint--;	
				}
				if (player_Hitpoint < 1) {
					Player_life = 0;
				}
				ex = new Explosion(x, y, 1);
				Explosion_List.add(ex);
				Missile_List.remove(i);
			}
			if (Crash(x, y, ms.x, ms.y, Player_img, Missile2_img) && (ms.who == 2 || ms.who == 3 )) {
				if(KeyC == false) {
					player_Hitpoint -= 3;
				}
				if (player_Hitpoint < 1) {
					Player_life = 0;
				}
				ex = new Explosion(x, y, 1);
				Explosion_List.add(ex);
				Missile_List.remove(i);
			}
			if( she == true) {
				if (Crash(shex, shey, ms.x, ms.y, she_img, Missile_img) && (ms.who==1 || ms.who==4)) {
					sheHP -= 80;
					ex = new Explosion(shex, shey, 1);
					Explosion_List.add(ex);
					Missile_List.remove(i);
				}
			}
			if( she == true) {
				if (Crash(shex, shey, ms.x, ms.y, she_img, Missile2_img) && (ms.who==2 || ms.who==3)) {
					sheHP -= 150;
					ex = new Explosion(shex, shey, 1);
					Explosion_List.add(ex);
					Missile_List.remove(i);
				}
			}
			for (int j = 0; j < Enemy_List.size(); j++) {
				en = (Enemy) Enemy_List.get(j);
				if (Crash(ms.x, ms.y, en.x, en.y, Missile_img, Enemy_img) && ms.who == 0) {
					EnHP--;
					Missile_List.remove(i);
					if (EnHP == 0) {
						Enemy_List.remove(j);
						game_Score += 50;
						ex = new Explosion(en.x + Enemy_img.getWidth(null) / 2, en.y + Enemy_img.getHeight(null) / 2,
								0);
						Explosion_List.add(ex);
						EnHP = 30;
					}
					game_Score += 10; // 게임 점수를 +10점.
				}
			}
			for (int j = 0; j < Boss_List.size(); j++) {
				bs = (Boss) Boss_List.get(0);
				// if ((cnt % fire_Speed) == 0) {
				if (Crash(ms.x, ms.y, bs.x + 130, bs.y, Missile_img, Boss1_img) && ms.who == 0) {
					bsHP--;
					game_Score += 10;
					Missile_List.remove(i);
					if (bsHP == 0) {
						Boss_life = 0;
						player_Hitpoint = 100;
						sheHP = 10000;
						game_Score += 2000;
						Boss_List.remove(0);
						bex = new BossExplo(bs.x + Boss1_img.getWidth(null) / 2, bs.y + Boss1_img.getHeight(null) / 2);
						Explosion2_List.add(bex);
					}
				}
				// }
			}
		}
	}

	public void EnemyProcess() {
		for (int i = 0; i < Enemy_List.size(); i++) {
			en = (Enemy) (Enemy_List.get(i));
			en.move();
			if (en.x < -200) {
				Enemy_List.remove(i);
			}
			if (cnt % 30 == 0) {
				ms = new Missile(en.x, en.y + 25, missile_Speed, 4, 210);
				Missile_List.add(ms);
			}
			if (Crash(x, y, en.x, en.y, Player_img, Enemy_img)) {
				player_Hitpoint--; // 플레이어 체력을 1깍습니다.
				if (player_Hitpoint < 1) {
					Player_life = 0;

				}
				Enemy_List.remove(i); // 적을 제거합니다.
				game_Score += 10;
				ex = new Explosion(en.x + Enemy_img.getWidth(null) / 2, en.y + Enemy_img.getHeight(null) / 2, 0);
				Explosion_List.add(ex);
				ex = new Explosion(x, y, 1);
				Explosion_List.add(ex);
			}
		}
		if (cnt % 200 == 10) {
			en = new Enemy(f_width + 100, 100, enemy_speed);
			Enemy_List.add(en);
			en = new Enemy(f_width + 100, 200, enemy_speed);
			Enemy_List.add(en);
			en = new Enemy(f_width + 100, 300, enemy_speed);
			Enemy_List.add(en);
			en = new Enemy(f_width + 100, 400, enemy_speed);
			Enemy_List.add(en);
			en = new Enemy(f_width + 100, 500, enemy_speed);
			Enemy_List.add(en);
		}
		if (cnt % bstime == bstime - 10) {
			en = new Enemy(f_width + 100, 100, enemy_speed);
			Enemy_List.add(en);
			bs = new Boss(f_width + 100, 100, boss_speed);
			if (Boss_List.size() < 1) {
				Boss_List.add(bs);
			}
			en = new Enemy(f_width + 100, 500, enemy_speed);
			Enemy_List.add(en);
		}
	}

	public void BossProcess() {
		// if (Enemy_List.size() < 1) {}
		for (int i = 0; i < Boss_List.size(); i++) {
			bs = (Boss) (Boss_List.get(0));
			if (bs.x > 800) {
				bs.move();
			}
			if (bs.x < -200) {
				Boss_List.remove(i);
			}
			if (cnt % 15 == 0) {
				ms = new Missile(bs.x + 50, bs.y + 210, missile_Speed, 2, 180);
				Missile_List.add(ms);
			}
			if (cnt % 30 == 0) {
				ms = new Missile(bs.x + 50, bs.y + 210, missile_Speed, 2, 165);
				Missile_List.add(ms);
				ms = new Missile(bs.x + 50, bs.y + 210, missile_Speed, 2, 195);
				Missile_List.add(ms);
			}
			if (cnt % 60 == 0) {
				ms = new Missile(bs.x + 50, bs.y + 210, missile_Speed, 2, 150);
				Missile_List.add(ms);
				ms = new Missile(bs.x + 50, bs.y + 210, missile_Speed, 2, 210);
				Missile_List.add(ms);
			}
			if ((cnt % fire_Speed) == 0) {
				if (Crash(x - 130, y, bs.x, bs.y, Player_img, Boss1_img)) {
					player_Hitpoint--; // 플레이어 체력을 1깍습니다.
					ex = new Explosion(bs.x + Boss1_img.getWidth(null) / 2, bs.y + Boss1_img.getHeight(null) / 2, 0);
					Explosion_List.add(ex);
					ex = new Explosion(x, y, 1);
					Explosion_List.add(ex);
				}
			}
		}
	}

	public void ExplosionProcess() {
		for (int i = 0; i < Explosion_List.size(); i++) {
			ex = (Explosion) Explosion_List.get(i);
			ex.effect();
		}
	}

	public void BossExploProcess() {
		for (int i = 0; i < Explosion2_List.size(); i++) {
			bex = (BossExplo) Explosion2_List.get(i);
			bex.effect();
		}
	}

	public boolean Crash(int x1, int y1, int x2, int y2, Image img1, Image img2) {
		boolean check = false;
		// if (Player_life == 1) {
		if (Math.abs((x1 + img1.getWidth(null) / 2) - (x2 + img2.getWidth(null) / 2)) < (img2.getWidth(null) / 2
				+ img1.getWidth(null) / 2)
				&& Math.abs((y1 + img1.getHeight(null) / 2)
						- (y2 + img2.getHeight(null) / 2)) < (img2.getHeight(null) / 2 + img1.getHeight(null) / 2)) {
			check = true;// 위 값이 true면 check에 true를 전달합니다.
		} else {
			check = false;
			// }
		}
		return check; // check의 값을 메소드에 리턴 시킵니다.
	}

	public void paint(Graphics g) {
		buffImage = createImage(f_width, f_height);
		buffg = buffImage.getGraphics();
		update(g);
	}

	public void update(Graphics g) {
		Draw_Background(); // 배경 이미지 그리기 메소드 실행
		if (gamestart==0) {
			buffg.drawImage(move_img, (f_width-978)/2,150, this);
			buffg.drawImage(att_img, (f_width-978)/2, 300, this);
			buffg.drawImage(boomKey_img, (f_width-978)/2+400, 300, this);
			buffg.drawImage(shKey_img, (f_width-978)/2+800, 300, this);
		}
		if (bm_im == true) {
			buffg.drawImage(Boom_img, (f_width-978)/2, 0, this);
			bti++;
			if(bti==10) {
				bm_im=false;
				bti=0;
			}
		}
		Draw_Player(); // 플레이어를 그리는 메소드 이름 변경
		Draw_Enemy();
		Draw_Missile();
		if (Boss_life == 1) {
			Draw_Boss();
		}
		Draw_Explosion();// 폭발이펙트그리기 메소드 실행
		Draw_BossExplo();
		Draw_StatusText();// 상태 표시 텍스트를 그리는 메소드 실행
		if (she == true) {
			buffg.drawImage(she_img,shex,shey,this);
		}
		g.drawImage(buffImage, 0, 0, this);
		// }
	}

	public void Draw_Background() {
		buffg.clearRect(0, 0, f_width, f_height);
		if (bx > -4754) {
			buffg.drawImage(BackGround_img, bx, 0, this);
			buffg.drawImage(BackGround2_img, bx + 2377, 0, this);
			buffg.drawImage(BackGround_img, bx + 4754, 0, this);
			bx -= 3;
		} else {
			bx = 0;
		}

		for (int i = 0; i < cx.length; i++) {
			if (cx[i] < 1400) {
				cx[i] += 5 + i * 3;
			} else {
				cx[i] = 0;
			}
			buffg.drawImage(Cloud_img[i], 1200 - cx[i], 50 + i * 200, this);
		}
	}

	public void Draw_Boss() {
		for (int i = 0; i < Boss_List.size(); i++) {
			bs = (Boss) (Boss_List.get(0));
			buffg.drawImage(Boss1_img, bs.x, bs.y, this);
		}
	}

	public void Draw_Player() {
		buffg.drawImage(Player_img, x, y, this);
	}

	public void Draw_Missile() {
		for (int i = 0; i < Missile_List.size(); i++) {
			ms = (Missile) (Missile_List.get(i));
			if (ms.who == 0) {
				buffg.drawImage(Missile_img, ms.x, ms.y, this);
			} else if (ms.who == 1 || ms.who == 4) {
				buffg.drawImage(Missile_img, ms.x, ms.y, this);
			} else if (ms.who == 2 || ms.who == 3) {
				buffg.drawImage(Missile2_img, ms.x, ms.y, this);
			}
		}
	}

	public void Draw_Enemy() {
		for (int i = 0; i < Enemy_List.size(); i++) {
			en = (Enemy) (Enemy_List.get(i));
			buffg.drawImage(Enemy_img, en.x, en.y, this);
		}
	}

	public void Draw_BossExplo() {
		for (int i = 0; i < Explosion2_List.size(); i++) {
			bex = (BossExplo) Explosion2_List.get(0);
			if (bex.bex_cnt < 3) {
				buffg.drawImage(Explo2_img[0], bex.x - Explo2_img[0].getWidth(null) / 2,
						bex.y - Explo2_img[0].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 6) {
				buffg.drawImage(Explo2_img[1], bex.x - Explo2_img[1].getWidth(null) / 2,
						bex.y - Explo2_img[1].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 9) {
				buffg.drawImage(Explo2_img[2], ex.x - Explo2_img[2].getWidth(null) / 2,
						bex.y - Explo2_img[2].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 12) {
				buffg.drawImage(Explo2_img[3], ex.x - Explo2_img[3].getWidth(null) / 2,
						bex.y - Explo2_img[3].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 15) {
				buffg.drawImage(Explo2_img[4], ex.x - Explo2_img[4].getWidth(null) / 2,
						bex.y - Explo2_img[4].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 18) {
				buffg.drawImage(Explo2_img[5], ex.x - Explo2_img[5].getWidth(null) / 2,
						bex.y - Explo2_img[5].getHeight(null) / 2, this);
			} else if (bex.bex_cnt < 21) {
				buffg.drawImage(Explo2_img[6], ex.x - Explo2_img[6].getWidth(null) / 2,
						bex.y - Explo2_img[6].getHeight(null) / 2, this);
			} else if (bex.bex_cnt > 24) {
				Explosion2_List.remove(0);
				bex.bex_cnt = 0;
			}
		}

	}

	public void Draw_Explosion() {
		for (int i = 0; i < Explosion_List.size(); i++) {
			ex = (Explosion) Explosion_List.get(i);
			if (ex.damage == 0) {
				if (ex.ex_cnt < 1) {
					buffg.drawImage(Explo_img[0], ex.x - Explo_img[0].getWidth(null) / 2,
							ex.y - Explo_img[0].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 2) {
					buffg.drawImage(Explo_img[1], ex.x - Explo_img[1].getWidth(null) / 2,
							ex.y - Explo_img[1].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 3) {
					buffg.drawImage(Explo_img[2], ex.x - Explo_img[2].getWidth(null) / 2,
							ex.y - Explo_img[2].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 4) {
					buffg.drawImage(Explo_img[3], ex.x - Explo_img[3].getWidth(null) / 2,
							ex.y - Explo_img[3].getHeight(null) / 2, this);
					// } else if (ex.ex_cnt < 5) {
					// buffg.drawImage(Explo_img[4], ex.x - Explo_img[4].getWidth(null) / 2,
					// ex.y - Explo_img[4].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 6) {
					buffg.drawImage(Explo_img[5], ex.x - Explo_img[5].getWidth(null) / 2,
							ex.y - Explo_img[5].getHeight(null) / 2, this);
					// } else if (ex.ex_cnt < 8) {
					// buffg.drawImage(Explo_img[6], ex.x - Explo_img[6].getWidth(null) / 2,
					// ex.y - Explo_img[6].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 7) {
					buffg.drawImage(Explo_img[7], ex.x - Explo_img[7].getWidth(null) / 2,
							ex.y - Explo_img[7].getHeight(null) / 2, this);
				} else if (ex.ex_cnt > 8) {
					Explosion_List.remove(i);
					ex.ex_cnt = 0;
				}
			} else { // 설정값이 1이면 단순 피격용 이미지 그리기
				if (ex.ex_cnt < 1) {
					buffg.drawImage(Explo_img[0], ex.x - Explo_img[0].getWidth(null) / 2,
							ex.y - Explo_img[0].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 2) {
					buffg.drawImage(Explo_img[1], ex.x - Explo_img[1].getWidth(null) / 2,
							ex.y - Explo_img[1].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 3) {
					buffg.drawImage(Explo_img[2], ex.x - Explo_img[2].getWidth(null) / 2,
							ex.y - Explo_img[2].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 4) {
					buffg.drawImage(Explo_img[3], ex.x - Explo_img[3].getWidth(null) / 2,
							ex.y - Explo_img[3].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 5) {
					buffg.drawImage(Explo_img[4], ex.x - Explo_img[4].getWidth(null) / 2,
							ex.y - Explo_img[4].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 6) {
					buffg.drawImage(Explo_img[5], ex.x - Explo_img[5].getWidth(null) / 2,
							ex.y - Explo_img[5].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 7) {
					buffg.drawImage(Explo_img[6], ex.x - Explo_img[6].getWidth(null) / 2,
							ex.y - Explo_img[6].getHeight(null) / 2, this);
				} else if (ex.ex_cnt < 8) {
					buffg.drawImage(Explo_img[7], ex.x - Explo_img[7].getWidth(null) / 2,
							ex.y - Explo_img[7].getHeight(null) / 2, this);
				} else if (ex.ex_cnt > 9) {
					Explosion_List.remove(i);
					ex.ex_cnt = 0;
				}
			}
		}
	}

	public void Draw_StatusText() { // 상태 체크용 텍스트를 그립니다.
		buffg.setFont(new Font("Defualt", Font.BOLD, 20));
		buffg.drawString("SCORE : " + game_Score, 1000, 70);
		buffg.drawString("HitPoint : " + player_Hitpoint, 1000, 90);
		buffg.drawString("boss_HP : " + bsHP, 1000, 110);
		buffg.drawString("boom : " + boom, 1000, 130);
		buffg.drawString("shield_HP : " + sheHP, 1000, 150);
		if (Player_life == 0) {
			buffg.drawImage(GameOver, 270, 110, this);
		}
		if (bsHP <= 0) {
			buffg.drawImage(cupon_img, (1200-928)/2, 50, this);
		}
		
	}

	public void KeyProcess() {
		if (KeyUp == true) {
			if (y > 20)
				y -= player_Speed;
		}
		if (KeyDown == true) {
			if (y + Player_img.getHeight(null) < f_height)
				y += player_Speed;
		}
		if (KeyLeft == true) {
			if (x > 0)
				x -= player_Speed;
		}
		if (KeyRight == true) {
			if (x + Player_img.getWidth(null) < f_width)
				x += player_Speed;
		}
	}

	public void keyPressed(KeyEvent e) {
		switch (e.getKeyCode()) {
		case KeyEvent.VK_UP:
			KeyUp = true;
			break;
		case KeyEvent.VK_DOWN:
			KeyDown = true;
			break;
		case KeyEvent.VK_LEFT:
			KeyLeft = true;
			break;
		case KeyEvent.VK_RIGHT:
			KeyRight = true;
			break;
		case KeyEvent.VK_Z:
			KeyZ = true;
			break;
		case KeyEvent.VK_R:
			new gameFrame3();
			this.setVisible(false);
		case KeyEvent.VK_SPACE:
			gamestart = 1;
			break;
		case KeyEvent.VK_X:
			KeyX = true;
			if( boom == true) {
				Missile_List.removeAll(Missile_List);
				boom = false;
				time = 0;
				bm_im = true;
			}
			break;
		case KeyEvent.VK_C:
			KeyC = true;
			if(sheHP > 200) {
				she = true;
			}
			break;
		}
	}

	public void keyReleased(KeyEvent e) {
		switch (e.getKeyCode()) {
		case KeyEvent.VK_UP:
			KeyUp = false;
			break;
		case KeyEvent.VK_DOWN:
			KeyDown = false;
			break;
		case KeyEvent.VK_LEFT:
			KeyLeft = false;
			break;
		case KeyEvent.VK_RIGHT:
			KeyRight = false;
			break;
		case KeyEvent.VK_Z:
			KeyZ = false;
			break;
		case KeyEvent.VK_SPACE:
			break;
		case KeyEvent.VK_X:
			KeyX = false;
			break;
		case KeyEvent.VK_C:
			KeyC = false;
			she = false;
			break;
		}
	}

	public void keyTyped(KeyEvent e) {
	}

}
