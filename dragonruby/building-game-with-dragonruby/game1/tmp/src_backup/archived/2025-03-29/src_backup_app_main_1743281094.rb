def tick args
  args.outputs.sprites << [120, 280, 100, 80, 'sprites/misc/dragon-0.png']
end

def ticks(args)
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  args.outputs.sprites << [args.state.player_x, args.state.player_y, 100, 80, 'sprites/misc/dragon-0.png']
end
