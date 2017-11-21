 
INSERT INTO credentials(username,password, enabled) VALUES ('guest','$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS', TRUE);
INSERT INTO credentials(username,password, enabled) VALUES ('admin','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe', TRUE);

INSERT INTO credentials(username,password, enabled) VALUES ('counselor','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe', TRUE);
  
INSERT INTO authority (username, authority) VALUES ('guest', 'ROLE_USER');
INSERT INTO authority (username, authority) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authority (username, authority) VALUES ('counselor', 'ROLE_COUNSELOR');
 
INSERT INTO  person (firstname, lastname,emailAddress, person_id) VALUES ('Curious','George','admin@admin.com','admin');
INSERT INTO person (firstname, lastname,emailAddress,person_id) VALUES ('Allen','Rench','guest@guest.com','guest');
INSERT INTO person (firstname, lastname,emailAddress,person_id) VALUES ('Dipesh','Rijal','counsel@counsel.com','counselor');
 
					