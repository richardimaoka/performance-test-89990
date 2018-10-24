-- example script for creating json file report

function done(summary, latency, requests)
  file = io.open('wrk_output.json', 'w')
  io.output(file)

  io.write(string.format("{\n"))

  io.write(string.format("  \"endpoint\": \"%s://%s/%s\", \n", wrk.scheme, wrk.host, wrk.path ))

  io.write(string.format("  \"summary\": {\n"))
  io.write(string.format("    \"duration\":         %d,\n",      summary.duration))
  io.write(string.format("    \"requests\":         %d,\n",      summary.requests))
  io.write(string.format("    \"bytes\":            %d,\n",      summary.bytes))
  io.write(string.format("    \"requests_per_sec\": %.2f,\n",    summary.requests/(summary.duration)))
  io.write(string.format("    \"transfer_per_sec\": \"%.2f\"\n", summary.bytes/(summary.duration*1048576)))
  io.write(string.format("  },\n"))

  io.write(string.format("  \"latency\": {\n"))
  io.write(string.format("    \"min\":           %.2f,\n", latency.min))
  io.write(string.format("    \"max\":           %.2f,\n", latency.max))
  io.write(string.format("    \"mean\":          %.2f,\n", latency.mean))
  io.write(string.format("    \"stdev\":         %.2f,\n", latency.stdev))
  io.write(string.format("    \"percentile_90\": %.2f,\n", latency:percentile(90.0)))
  io.write(string.format("    \"percentile_95\": %.2f,\n", latency:percentile(95.0)))
  io.write(string.format("    \"percentile_99\": %.2f\n",  latency:percentile(99.0)))
  io.write(string.format("  }\n"))

   
  io.write(string.format("}\n"))
end

