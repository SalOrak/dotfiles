from kitty.boss import Boss
from kittens.tui.handler import result_handler
from kittens.tui.loop import debug

from pathlib import Path
import re

def main(args: list[str]) -> str:
    pass

@result_handler(no_ui=True)
def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss) -> None:
    w = boss.window_id_map.get(target_window_id)
    if w is None:
        return;

    procs = w.child.foreground_processes
    cwd = procs[0].get("cwd") if procs is not None and len(procs) > 0 else None
    if cwd is None:
        return

    name_prefix = re.escape("[w]")
    project_name = Path(cwd).name
    title_expr = str.format('title:"{} {}$"',name_prefix, project_name)

    opt_tab = boss.call_remote_control(w, ('!ls', '--self', '--match-tab', title_expr))

    for p in procs:
        cmd = p.get("cmdline")[0] if "cmdline" in p else None
        if cmd and re.search("hx$|nvim$|emacs$|emacsclient$", cmd):
            if opt_tab is not None:
                boss.call_remote_control(w, ("focus-tab", '--match', title_expr))
                return
            boss.call_remote_control( w, ( "send-key", "space" ))
            boss.call_remote_control( w, ( "send-text", "Y"))
            return
            

    boss.call_remote_control(
        w, ( "focus-tab", "--match", "recent:1", ),
    )

    return
