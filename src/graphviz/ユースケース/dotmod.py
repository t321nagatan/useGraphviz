# 要素をフラット化
def flatobj(data_yaml):
    data = {}
    for key in data_yaml.keys():
        value = data_yaml[key]
        data[key] = value

        if ('nest' in value):
            data.update(flatobj(value['nest']))

    return data

# レンダー
def render(dg, data_yaml):
    flatdata = flatobj(data_yaml)
    for key in data_yaml.keys():
        value = data_yaml[key]
        # print(key)
        dg.node(value['name'],shape=flatdata[key]['shape'])

        if ('edges' in value):
            for edge in value['edges'].keys():
                label = ''
                if (type(value['edges'][edge]) is dict and 'label' in value['edges'][edge]):
                    label = value['edges'][edge]['label']
                dg.edge(flatdata[key]['name'],flatdata[edge]['name'], label=label)

        if ('nest' in value):
            render(value['nest'])
    return dg
