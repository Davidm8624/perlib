def tick args
  args.outputs.labels << [102, 102, "Hello Dragon"]
  args.outputs.labels << [102, 100, "Hello Oboe!"]
end
