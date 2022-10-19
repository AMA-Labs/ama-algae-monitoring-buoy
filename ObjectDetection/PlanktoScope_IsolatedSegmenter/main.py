from segmenterinit import SegmenterProcess

sp = SegmenterProcess(None, "./data")

sp.minpixsize = 140
sp.maxpixsize = 10000
sp.segment_path("./sample", None)