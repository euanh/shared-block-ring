(*
 * Copyright (C) 2013 Citrix Systems Inc
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)
open Lwt

(* The format will be:
   sector 0: producer pointer (as a byte offset)
   sector 1: consumer pointer (as a byte offset)
   Each data item shall be prefixed with a 4-byte length, followed by
   the payload. *)

module Producer(B: S.BLOCK_DEVICE) = struct

  type t = {
    device: B.t;
    info: B.info;
    next: int64;
  }

  let create device =
    B.get_info device >>= fun info ->
    return (`Ok {
      device;
      info;
      next = 0L;
    })

  let push t item =
    return (`Error "unimplemented")

  let get_free_space t =
    return (`Error "unimplemented")

end

module Consumer(B: S.BLOCK_DEVICE) = struct

  type t = {
    device: B.t;
    info: B.info;
    next: int64;
  }

  let create device =
    B.get_info device >>= fun info ->
    return (`Ok {
      device;
      info;
      next = 0L;
    })

  let pop t =
    return (`Error "unimplemented")

  let get_consumed_space t =
    return (`Error "unimplemented")
end

