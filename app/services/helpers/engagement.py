import math
from .clamp import clamp
from .difficulty import compute_difficulty_factor
from .interactions import compute_interaction_factor


def compute_engagement_score(time_spent, expected_time, scroll_depth, clicks, mouse_moves, scrolls, user_diff):
    time_term = min(time_spent / expected_time, 1.25) /1.25

    if scroll_depth > 1:
        scroll_depth /= 100.0
    scroll_term = clamp(scroll_depth, 0.0, 1.0)

    interaction = compute_interaction_factor(clicks, mouse_moves, scrolls)


    diff_factor = compute_difficulty_factor(user_diff)

    print("\n")
    print("interaction", interaction)
    print("difficulty", diff_factor)
    print("scroll", scroll_term)
    print("time", clamp(time_term, 0, 1))


    score_raw = (
        0.5 * time_term +
        0.2 * scroll_term +
        0.2 * interaction +
        0.1 * diff_factor
    )

    score = clamp(score_raw, 0.0, 1.0) * 100

    return round(score, 2)