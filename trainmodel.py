def train_model():
    stop_increment = 3
    min_increment = 0
    for each epoch:
        for each batch:
            calculate the batch loss by running the batch
            through the model we built with build_model()
            if we have reached a new minimum:
                min_increment += 1
            if min_increment == stop_increment:
                break
        if min_increment == stop_increment:
            save the model in disk as a checkpoint
            return
