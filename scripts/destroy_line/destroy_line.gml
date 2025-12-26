function destroy_line() {

	var line_enemy = (instance_place(x+16,y,obj_enemyspawner));

	if (line_enemy) {

		if (line_enemy.enemy_id == enemy_id) {

			with (line_enemy) {

				if (my_enemy != noone) {

					with (my_enemy) {

						instance_destroy();

					}

				}

				instance_destroy();
				destroy_line();
								
			}

		}

	}

}

function apply_line() {
	
	var line_enemy = (instance_place(x+16,y,obj_enemyspawner));

	if (line_enemy) {

		if (line_enemy.enemy_id == enemy_id) {

			with (line_enemy) {
				
				if (my_enemy == noone)
				&& (!instance_in_view(self,view_camera[0],16)) {

					apply_line();
					primed = true;
					lined = true;
				
				}

			}

		}

	}
	
}