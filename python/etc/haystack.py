# def find_needle(id, haystack):  # don't expose internals to caller
#     for i, obj in enumerate(haystack):
#         if obj['id'] == id:
#             return dict(value=obj['value'], location=[i])
#
#         if isinstance(obj, list):
#             path = find_needle(id, haystack)
#             if path:
#                 return [i] + path
#
#     return 'wut'
#
#
# haystack = [
#     dict(id=1, value='red'),
#     dict(id=2, value='blue'),
#     [
#         dict(id=3, value='green'),
#         dict(id=4, value='yellow')
#     ],
#     [
#         [
#             [
#                 dict(id=5, value='purple'),
#                 [
#                     dict(id=6, value='orange')
#                 ],
#             ],
#         ],
#     ],
#     dict(id=7, value='brown'),
#     [
#         dict(id=8, value='pink')
#     ]
#
# ]
#
#
# def test_find_needle():
#     assert dict(
#         value='red',
#         location=[0]
#     ) == find_needle(1, haystack)
#
#     assert dict(
#         value='blue',
#         location=[1]
#     ) == find_needle(2, haystack)
#
#     assert dict(
#         value='green',
#         location=[2, 0]
#     ) == find_needle(3, haystack)
#
#     assert dict(value='purple',
#                 location=[3, 0]
#                 ) == find_needle(5, haystack)
#
#     assert dict(
#         value='orange',
#         location=[3, 0, 0, 1, 0]
#     ) == find_needle(5, haystack)

array = ["1", 2, ["4", "5", ("a", "b")], [[[[("c", "d")]]]]]


def myindex(lst, target):
    for index, item in enumerate(lst):
        if item == target:
            return [index]
        if isinstance(item, (list, tuple)):
            path = myindex(item, target)
            if path:
                return [index] + path
    return []

def test_myindex():
    assert [2,2,0] == myindex(array, "a")
    assert [3, 1] == myindex(array, "d")
