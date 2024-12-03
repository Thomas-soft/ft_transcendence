import { UserData } from "./UserData"

export type ApiResponse = 
{
    success: boolean
    error?: string
}

export interface UserDataResponse extends ApiResponse
{
    data: UserData
}