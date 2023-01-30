import enum
import typing


class State(enum.IntEnum):
    """CSC summaryState constants."""

    DISABLED = 1
    ENABLED = 2
    FAULT = 3
    OFFLINE = 4
    STANDBY = 5


def as_state(value: typing.Union[int, State]) -> typing.Union[int, State]:
    """Convert an int (or State) to a State.
    Return the original value if no match.
    """
    try:
        return State(value)
    except Exception:
        return value
