#!/usr/bin/env python
import mobius3


super_async_main = mobius3.async_main


async def async_main(syncer_args):
  stop = await super_async_main(syncer_args)
  with open("/tmp/ruok", "w") as f:
    f.write("imok")
  return stop


if __name__ == "__main__":
  mobius3.async_main = async_main
  mobius3.main()


