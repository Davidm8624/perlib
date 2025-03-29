def greet(friend)
  return "Hello #{friend}!"
end

def tick(args)
  args.outputs.labels << [120, 120, greet("Dragon")]
  args.outputs.labels << [120, 120, greet("oboe")]
  args.outputs.sprites << [120, 120, 100, 80, 'sprites/misc/dragon-0.png']
end
