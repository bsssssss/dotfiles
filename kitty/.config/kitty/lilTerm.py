from kittens.tui.handler import result_handler
from kitty.boss import Boss


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss) -> None:

    w = boss.window_id_map.get(target_window_id)

    if w is not None:
        boss.call_remote_control(
            w, ('launch', '--type=window', '--location=hsplit', '--cwd=current'))

        boss.call_remote_control(w, ('action', 'resize_window'))
