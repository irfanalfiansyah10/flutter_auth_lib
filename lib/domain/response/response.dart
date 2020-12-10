enum Status {
  success,
  error,
}

class Response<Error, Result>{
  Error error;
  Result result;

  Status status;

  bool get isError => status == error;

  Response.success(Result result){
    this.status = Status.success;
    this.result = result;
  }

  Response.error(Error error){
    this.status = Status.error;
    this.error = error;
  }
}