if (global.frozen || other.dead) exit;

collected = true;
instance_destroy();
global.points += 200;