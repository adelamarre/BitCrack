def divide_range(start_hex, end_hex, parts):
    start_dec = int(start_hex, 16)
    end_dec = int(end_hex, 16)

    total_size = end_dec - start_dec + 1
    segment_size = total_size // parts

    current_start = start_dec
    ranges = []

    for i in range(parts):
        current_end = current_start + segment_size - 1

        # Ensure the last segment ends correctly at END
        if i == parts - 1:
            current_end = end_dec

        start_hex_str = format(current_start, 'x')
        end_hex_str = format(current_end, 'x')
        ranges.append(f"{start_hex_str}:{end_hex_str}")

        current_start = current_end + 1

    return ranges

start = "20000000000000000"
end = "3ffffffffffffffff"
parts = 20

ranges = divide_range(start, end, parts)

for r in ranges:
    print(r)
