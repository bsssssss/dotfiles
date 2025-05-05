from kittens.tui.handler import result_handler
from kitty.boss import Boss


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(
        args: list[str],
        answer: str,
        target_window_id: int,
        boss: Boss
) -> None:

    w = boss.window_id_map.get(target_window_id)

    if w is None or not args:
        return

    commands = {
        'h': [
            ('launch', '--type=window', '--location=hsplit',
             '--cwd=current', '--bias=30')
        ],
        'v': [
            ('launch', '--type=window', '--location=vsplit',
             '--cwd=current', '--bias=40')
        ]
    }

    command_list = commands.get(args[1])

    if command_list is None:
        print("Invalid argument, use 'h' or 'v'")
        return

    for command in command_list:
        boss.call_remote_control(w, command)
