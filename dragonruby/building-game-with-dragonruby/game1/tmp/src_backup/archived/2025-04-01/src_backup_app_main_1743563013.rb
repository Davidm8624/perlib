def tick args
  args.state.player ||= {
    x: 120,
    y: 280,
    w: 100,
    h: 80,
    speed: 12,
    path: 'sprites/misc/dragon-0.png',
  }
args.state.fireballs ||= []
args.state.targets ||= [
  {
    x: 800,
    y: 120,
    w: 64,
    h: 64,
    path: 'sprites/target.png'
  },
  {
    x: 920,
    y: 600,
    w: 64,
    h: 64,
    path: 'sprites/target.png'
  },
  {
    x: 1020,
    y: 320,
    w: 64,
    h: 64,
    path: 'sprites/target.png'
  }
]

  if args.inputs.left
    args.state.player.x -= args.state.player.speed
  elsif args.inputs.right
    args.state.player.x += args.state.player.speed
  end
  
  if args.inputs.up
    args.state.player.y += args.state.player.speed
  elsif args.inputs.down
    args.state.player.y -= args.state.player.speed
  end
  
  if args.state.player.x + args.state.player.w > args.grid.w
    args.state.player.x = args.grid.w - args.state.player.w
  end
  
  if args.state.player.x < 0
    args.state.player.x = 0
  end

  if args.state.player.y + args.state.player.h > args.grid.h
    args.state.player.y = args.grid.h - args.state.player.h
  end
  
  if args.state.player.y < 0
    args.state.player.y = 0
  end
  
  if args.inputs.keyboard.key_down.z ||
    args.inputs.keyboard.key_down.j ||
    args.inputs.controller_one.key_down.a
    args.state.fireballs << {
      x: args.state.player.x + args.state.player.w - 12,
      y: args.state.player.y + 10,
      w: 32,
      h: 32,
      path: 'sprites/fireball.png'
    }
  end

  args.state.fireballs.each do |fireball|
    fireball.x += args.state.player.speed + 2
  end
  

  args.outputs.sprites << [args.state.player, args.state.fireballs, args.state.targets]
end
