from .clamp import clamp

def compute_interaction_factor(clicks, mouse_moves, scrolls):
    click_max = 20
    mouse_max = 500
    scrolls_max = 100

    w_click = 0.2
    w_mouse = 0.3
    w_scrolls = 0.5

    clicks_n = clamp(clicks / max(1, click_max))
    mouse_n = clamp(mouse_moves / max(1, mouse_max))
    scrolls_n= clamp(scrolls / max(1, scrolls_max))

    total_w = w_click + w_mouse + w_scrolls

    return (clicks_n * w_click + mouse_n * w_mouse + scrolls_n * w_scrolls) / total_w